//
//  DetailViewModel.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 16/2/22.
//

import Foundation

class DetailViewModel {
    let image: UnsplashPhotoModel
    
    init(image: UnsplashPhotoModel) {
        self.image = image
    }
    
    func getImageUrl() -> URL? {
        return URL(string: image.urls?[UrlType.full.rawValue] ?? "")
    }
}
