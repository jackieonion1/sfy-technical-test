//
//  ImageViewDownloaderExtension.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 16/2/22.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL, spinner: Bool = false) {
        if spinner {
            self.showSpinner()
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.removeSpinner()
                        self?.image = image
                    }
                }
            }
        }
    }
}
