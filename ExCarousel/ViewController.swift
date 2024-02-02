//
//  ViewController.swift
//  ExCarousel
//
//  Created by Minjoo Kim on 2/2/24.
//

import UIKit

import SnapKit

final class ViewController: UIViewController {

    // MARK: - Properties
    
    var dummy = Entity.dummy()
    
    // MARK: - UI Components
    
    private let carouselView = View()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = carouselView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setRegister()
        setCarousel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        carouselView.collectionView.setContentOffset(.init(x: 2 * (Const.itemSize.width + Const.itemSpacing) - Const.insetX, y: carouselView.collectionView.contentOffset.y), animated: false)
    }
}

// MARK: - Extensions

private extension ViewController {
    func setDelegate() {
        self.carouselView.collectionView.dataSource = self
        self.carouselView.collectionView.delegate = self
    }
    
    func setRegister() {
        carouselView.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    func setCarousel() {
        carouselView.pageControl.numberOfPages = dummy.count
        dummy.insert(dummy[dummy.count-1], at: 0)
        dummy.insert(dummy[dummy.count-2], at: 0)
        dummy.append(dummy[2])
        dummy.append(dummy[3])
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return CollectionViewCell() }
        cell.bind(model: dummy[indexPath.item])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let scrolledOffsetX = targetContentOffset.pointee.x + scrollView.contentInset.left
        let cellWidth = Const.itemSize.width + Const.itemSpacing
        let index = round(scrolledOffsetX / cellWidth)
        targetContentOffset.pointee = CGPoint(x: index * cellWidth - scrollView.contentInset.left, y: scrollView.contentInset.top)
    }
}

extension ViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        carouselView.pageControl.currentPage = Int((scrollView.contentOffset.x - Const.insetX) / (Const.itemSize.width + Const.itemSpacing)) - 1
        let count = dummy.count
        if scrollView.contentOffset.x-2 <= Const.itemSize.width + Const.itemSpacing - Const.insetX {
            scrollView.setContentOffset(.init(x: (Const.itemSize.width + Const.itemSpacing) * Double(count-3) - Const.insetX, y: scrollView.contentOffset.y), animated: false)
        }
        
        if scrollView.contentOffset.x+2 >= Double(count-2) * (Const.itemSize.width + Const.itemSpacing) - Const.insetX - Const.sideItem {
            scrollView.setContentOffset(.init(x: 2 * (Const.itemSize.width + Const.itemSpacing) - Const.insetX, y: scrollView.contentOffset.y), animated: false)
        }
    }
}
