//
//  UnsplashAPIManager.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 15/2/22.
//

import Foundation

class UnsplashAPIManager {
    public static let shared = UnsplashAPIManager()
    
    func getSearchPhotos(query: String,
                         success: @escaping ((UnsplashResponseModel) -> Void),
                         failure: @escaping (() -> Void)) {
        ServiceManager.shared.callService(urlString: "\(ManagersConstants.unsplashBaseUrl)search/photos?query=\(query)", httpMethod: .get) {
            (response: UnsplashResponseModel) in
            success(response)
        } failure: {
            failure()
        }
    }
}
