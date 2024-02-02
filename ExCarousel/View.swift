//
//  View.swift
//  ExCarousel
//
//  Created by Minjoo Kim on 2/2/24.
//

import UIKit

import SnapKit

final class View: UIView {
    
    // MARK: - UI Components
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = Const.itemSize
        layout.minimumLineSpacing = Const.itemSpacing
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.isPagingEnabled = false
        view.contentInsetAdjustmentBehavior = .never
        view.contentInset = Const.collectionViewContentInset
        view.decelerationRate = .fast
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: self.frame.maxY - 100, width: self.frame.maxX, height: 50))
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .systemPink
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension View {
    
    func setUI() {
        self.backgroundColor = .white
        pageControl.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    }

    func setLayout() {
        
        [collectionView, pageControl].forEach {
            self.addSubview($0)
        }
        
        collectionView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(Const.itemSize.height)
        }
        
        pageControl.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
        }
    }
}
