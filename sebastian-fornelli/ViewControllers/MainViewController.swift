//
//  MainViewController.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 15/2/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self,
                                forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
    }
}

// MARK: UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 20) / 3
        return CGSize(width: width, height: width)
    }
}

// MARK: UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.reuseIdentifier,
            for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure()
        return cell
    }
}
