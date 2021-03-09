//
//  MyCollectionViewController.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/3/21.
//

import UIKit
import ObjectMapper

class MyCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, PresentingVCDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    lazy var url = ""
    var myentity: Entity?
    var entityDescriptions: [EntityDescription]? {
        didSet {
            self.updateUI()
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "CollectionCell", bundle: nil),forCellWithReuseIdentifier: "CollectionCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.startAnimating()
        
        if let entity = myentity {
            AlamofireRequest.reusableRequest(url: url,
                                             description: entity) { [weak self] (descriptions) in
                self?.entityDescriptions = descriptions
            }
        }
    }
    
    // MARK: - Methods
    func pushVC(string: String, description: Entity) {
        let vc = MyCollectionViewController(nibName: "MyCollectionViewController", bundle: nil)
        vc.url = string
        vc.myentity = description
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func updateUI() {
        self.activityIndicator.stopAnimating()
        self.collectionView.reloadData()
    }
    
    // MARK:- UICollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let entityDescription = entityDescriptions else { return 0 }
        return entityDescription.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        guard let entityDescription = entityDescriptions else { return cell}
        let object = entityDescription[indexPath.row]
        cell.title.text = object.title
        cell.subtitles = object.subtitle
        cell.delegate = self
        return cell
    }
}
