//
//  MainViewModel.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 16/2/22.
//

import Foundation

class MainViewModel: BaseViewModel {
    var imagesLoaded: ((UnsplashResponseModel?, Bool) -> Void)?
    var imageList: [UnsplashPhotoModel]?
    
    override func callService(query: String, page: Int?) {
        UnsplashAPIManager.shared.getSearchPhotos(query: query, page: page, success: { [weak self] response in
            self?.imageList = response.results
            self?.handleResponse(response: response, success: true)
        }, failure: {
            self.handleResponse(response: nil, success: false)
        })
    }
    
    private func handleResponse(response: UnsplashResponseModel?, success: Bool) {
        if let imagesLoaded = self.imagesLoaded {
            imagesLoaded(response, success)
        }
    }
    
    func numberOfRows() -> Int {
        return self.imageList?.count ?? 0
    }
    
    func getImage(index: Int) -> UnsplashPhotoModel? {
        return self.imageList?[index]
    }
}
