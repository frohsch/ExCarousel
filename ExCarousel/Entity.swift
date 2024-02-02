//
//  Entity.swift
//  ExCarousel
//
//  Created by Minjoo Kim on 2/2/24.
//

import UIKit

struct Entity {
    let color: UIColor
    let text: String
}

extension Entity {
    static func dummy() -> [Entity] {
        return [Entity(color: .systemRed, text: "First Cell"),
                Entity(color: .systemOrange, text: "Second Cell"),
                Entity(color: .systemYellow, text: "Third Cell"),
                Entity(color: .systemGreen, text: "Fourth Cell"),
                Entity(color: .systemBlue, text: "Fifth Cell")]
    }
}
