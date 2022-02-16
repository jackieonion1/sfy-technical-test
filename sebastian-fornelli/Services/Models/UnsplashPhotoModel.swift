//
//  UnsplashPhotoModel.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 15/2/22.
//

import Foundation

struct UnsplashPhotoModel: Decodable {
    let id, createdAt, description: String?
    let urls: [String: String]?
    
    enum CodingKeys: String, CodingKey {
        case id, description, urls
        case createdAt = "created_at"
    }
}
