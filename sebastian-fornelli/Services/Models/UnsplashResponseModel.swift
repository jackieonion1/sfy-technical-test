//
//  UnsplashResponseModel.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 15/2/22.
//

import Foundation

struct UnsplashResponseModel: Decodable {
    let total, totalPages: Int?
    let results: [UnsplashPhotoModel]?
    
    enum CodingKeys: String, CodingKey {
        case total, results
        case totalPages = "total_pages"
    }
}
