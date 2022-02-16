//
//  DetailViewController.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 16/2/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var detailViewModel: DetailViewModel?

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = detailViewModel?.getImageUrl() {
            imageView.load(url: url, spinner: true)
        }
    }
}
