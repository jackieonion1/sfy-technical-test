//
//  SpinnerViewControllerExtension.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 16/2/22.
//

import Foundation
import UIKit

var Loader: UIView?

extension UIView {
    func showSpinner() {
        let spinnerView = UIView.init(frame: self.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let activityIndicator = UIActivityIndicatorView.init(style: .large)
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            self.addSubview(spinnerView)
        }
        Loader = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            Loader?.removeFromSuperview()
            Loader = nil
        }
    }
}
