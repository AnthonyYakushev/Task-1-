//
//  CollectionCell.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/3/21.
//

import UIKit

class CollectionCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Properties
    var subtitles = [String]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    var delegate: PresentingVCDelegate?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib.init(nibName: "NewCollectionCell", bundle: nil), forCellWithReuseIdentifier: "newCollectionCell")
    }
    
    // MARK: - UICollectionViewCell Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subtitles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newCollectionCell", for: indexPath as IndexPath) as! NewCollectionCell
        
        let subtitle = subtitles[indexPath.row]
        if subtitle.contains("http") {
            cell.subtitleLabel.text = "Link №\(indexPath.row + 1)"
        } else {
            cell.subtitleLabel.text = subtitle
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let subtitle = subtitles[indexPath.row]
        
        if subtitle.contains("http") {
            switch subtitle {
            case let str where str.contains("films"):
                delegate?.pushVC(string: subtitle, description: .film)
            case let str where str.contains("planets"):
                delegate?.pushVC(string: subtitle, description: .planet)
            case let str where str.contains("starships"):
                delegate?.pushVC(string: subtitle, description: .starship)
            case let str where str.contains("people"):
                delegate?.pushVC(string: subtitle, description: .people)
            case let str where str.contains("species"):
                delegate?.pushVC(string: subtitle, description: .species)
            case let str where str.contains("vehicles"):
                delegate?.pushVC(string: subtitle, description: .vehicle)
            default:
                break
            }
        }
    }
}
