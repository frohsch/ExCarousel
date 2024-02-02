//
//  CollectionViewCell.swift
//  ExCarousel
//
//  Created by Minjoo Kim on 2/2/24.
//

import UIKit

import SnapKit

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

// MARK: - Extensions

private extension CollectionViewCell {
    func setLayout() {
        self.addSubview(label)
        
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(50)
        }
    }
}

extension CollectionViewCell {
    func bind(model: Entity) {
        self.backgroundColor = model.color
        self.label.text = model.text
    }
}
