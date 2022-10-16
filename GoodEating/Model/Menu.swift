//
//  Menu.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/7/22.
//

import Foundation
import SwiftUI

struct MenuItem: Identifiable, Equatable {
    let id = UUID()
    var image: String
    var title: String
    var description: String
    var calories: Int
    var price: Float
    var isFavorite: Bool
    var rating: Float
}

struct MockMenu {
    static let data = [
        MenuItem(image: "foodiesfeed.com_appetizer-with-toasted-bread-and-whipped-butter",
                 title: "Classic Bread & Butter",
                 description: "Fresh Baked bread serve with a premium whipped butter spread.",
                 calories: 740,
                 price: 8.49,
                 isFavorite: false,
                 rating: 4.8)
    ]
}


