//
//  BaseViewModel.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 16/2/22.
//

import Foundation

class BaseViewModel: NSObject {
    override init() {
        super.init()
        callService(query: "flowers", page: nil)
    }
    
    func callService(query: String, page: Int?) {}
}
