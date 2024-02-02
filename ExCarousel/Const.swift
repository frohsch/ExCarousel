//
//  Const.swift
//  ExCarousel
//
//  Created by Minjoo Kim on 2/2/24.
//

import UIKit

enum Const {
    
    static let itemSize = CGSize(width: 280, height: 398)
    static let itemSpacing = 20.0
    static let sideItem = insetX - itemSpacing
    
    static var insetX: CGFloat {
        (UIScreen.main.bounds.width - Self.itemSize.width) / 2.0
    }
    
    static var collectionViewContentInset: UIEdgeInsets {
        UIEdgeInsets(top: 0, left: Self.insetX, bottom: 0, right: Self.insetX)
    }
}
