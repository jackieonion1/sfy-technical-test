//
//  MainViewController.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 15/2/22.
//

import UIKit

class MainViewController: UIViewController {
    
    private var mainViewModel = MainViewModel()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicatorView: UIView!
    @IBOutlet weak var activityIndicatorViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        self.view.showSpinner()
        self.mainViewModel.imagesLoaded = { [weak self] (_, success) in
            if success {
                DispatchQueue.main.async {
                    self?.view.removeSpinner()
                    if self?.mainViewModel.isReloading ?? false {
                        self?.mainViewModel.isReloading = false
                        self?.activityIndicatorView.isHidden = true
                        self?.activityIndicatorViewHeight.constant = 0
                    }
                    self?.collectionView.reloadData()
                }
            } else {
                print("failure")
            }
        }
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CollectionViewCell.reuseIdentifier, bundle: nil),
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYOffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYOffset
        if distanceFromBottom < height - 150 && contentYOffset > 0 {
            if !mainViewModel.isReloading {
                mainViewModel.isReloading = true
                activityIndicatorViewHeight.constant = 150
                activityIndicatorView.isHidden = false
                mainViewModel.callService(query: "flowers", page: mainViewModel.page)
            }
        }
    }
}

// MARK: UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.reuseIdentifier,
            for: indexPath) as? CollectionViewCell else {
                return UICollectionViewCell()
            }
        guard let model = mainViewModel.getImage(index: indexPath.row) else {
            return UICollectionViewCell()
        }
        cell.configure(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Detail", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "detail") as? DetailViewController else { return }
        if let imageModel = mainViewModel.getImage(index: indexPath.row) {
            vc.detailViewModel = DetailViewModel(image: imageModel)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
