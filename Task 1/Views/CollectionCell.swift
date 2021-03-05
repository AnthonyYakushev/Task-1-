//
//  CollectionCell.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/3/21.
//

import UIKit

class CollectionCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let vc = MyCollectionViewController(nibName: "MyCollectionViewController", bundle: nil) 

    var subtitles = [String]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    var delegate: PresentingVCDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib.init(nibName: "NewCollectionCell", bundle: nil), forCellWithReuseIdentifier: "newCollectionCell")
//        self.delegate = vc
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subtitles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newCollectionCell", for: indexPath as IndexPath) as! NewCollectionCell
        
        let subtitle = subtitles[indexPath.row]
        cell.subtitleLabel.text = subtitle
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .lightGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let subtitle = subtitles[indexPath.row]
        
        if subtitle.contains("http") {
            switch subtitle {
            case let str where str.contains("films"):
                delegate?.pushVC(string: subtitle, description: "films")
            case let str where str.contains("planets"):
                print("planets")
            case let str where str.contains("starships"):
                print("starships")
            case let str where str.contains("people"):
                print("people")
            case let str where str.contains("species"):
                print("species")
            case let str where str.contains("vehicles"):
                print("vehicles")
            default:
                break
            }
        }
    }
}
