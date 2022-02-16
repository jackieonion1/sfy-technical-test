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
                         page: Int?,
                         success: @escaping ((UnsplashResponseModel) -> Void),
                         failure: @escaping (() -> Void)) {
        var urlString = "\(ManagersConstants.unsplashBaseUrl)search/photos?query=\(query)&per_page=18"
        if let page = page {
            urlString.append("&page=\(String(describing: page))")
        }
        ServiceManager.shared.callService(urlString: urlString, httpMethod: .get) {
            (response: UnsplashResponseModel) in
            success(response)
        } failure: {
            failure()
        }
    }
}
