//
//  MainViewModel.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 16/2/22.
//

import Foundation

class MainViewModel: BaseViewModel {
    var imagesLoaded: ((UnsplashResponseModel?, Bool) -> Void)?
    var imageList: [UnsplashPhotoModel] = []
    var isReloading = false
    var page = 1
    
    override func callService(query: String, page: Int?) {
        self.page += 1
        UnsplashAPIManager.shared.getSearchPhotos(query: query, page: page, success: { [weak self] response in
            self?.imageList.append(contentsOf: response.results ?? [])
            self?.handleResponse(response: response, success: true)
        }, failure: {
            self.handleResponse(response: nil, success: false)
            self.page -= 1
        })
    }
    
    private func handleResponse(response: UnsplashResponseModel?, success: Bool) {
        if let imagesLoaded = self.imagesLoaded {
            imagesLoaded(response, success)
        }
    }
    
    func numberOfRows() -> Int {
        return self.imageList.count
    }
    
    func getImage(index: Int) -> UnsplashPhotoModel? {
        return self.imageList[index]
    }
}
