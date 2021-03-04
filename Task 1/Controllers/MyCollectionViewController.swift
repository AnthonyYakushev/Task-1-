//
//  MyCollectionViewController.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/3/21.
//

import UIKit

class MyCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    var people: People?
    var arrayDescriptions = [PeopleDescription]()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "CollectionCell", bundle: nil),forCellWithReuseIdentifier: "CollectionCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        if let people = people {
            arrayDescriptions = PeopleDescription.getArrayFromPeople(people)
        }
        collectionView.reloadData()
    }

    // MARK:- UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayDescriptions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        let object = arrayDescriptions[indexPath.row]
        
        cell.configureCell(object: object)
        
        return cell
    }
}
