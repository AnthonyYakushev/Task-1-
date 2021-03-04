//
//  CollectionCell.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/3/21.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    func configureCell(object: PeopleDescription) {
        self.title.text = object.title
    }
}
