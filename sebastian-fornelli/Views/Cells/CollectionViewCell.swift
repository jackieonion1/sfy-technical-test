//
//  CollectionViewCell.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 16/2/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    static let reuseIdentifier = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: UnsplashPhotoModel) {
        if let imageUrl = URL(string: model.urls?[UrlType.thumb.rawValue] ?? "") {
            imageView.load(url: imageUrl)
        }
    }
}
