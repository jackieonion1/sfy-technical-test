//
//  CollectionViewCell.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 16/2/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "collectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        self.backgroundColor = .blue
    }
}
