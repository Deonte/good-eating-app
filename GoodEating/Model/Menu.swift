//
//  Menu.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/7/22.
//

import Foundation

enum CourseCategory: CaseIterable {
    case appetizer
    case entrees
    case drinks
    case desserts
    case sides
    
    func description() -> String {
        switch self {
        case .appetizer:
            return "Appetizers"
        case .entrees:
            return "Entrees"
        case .drinks:
            return "Drinks"
        case .desserts:
            return "Desserts"
        case .sides:
            return "Sides"
        }
    }
}

protocol Menu {
    var category: CourseCategory { get }
    var image: String { get }
    var title: String { get }
    var description: String { get }
    var calories: Int { get }
    var price: Float { get }
    var isFavorite: Bool { get set }
    var rating: Float { get }
}

struct MenuItem: Menu, Identifiable {
    let id = UUID()
    var category: CourseCategory
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
        MenuItem(category: .appetizer,
                 image: "🍗",
                 title: "Spicy Chicken Bites",
                 description: "Fresh and tender hand-cut chicken tossed in a sweet and spicy chili-ginger sauce.",
                 calories: 740,
                 price: 6.49,
                 isFavorite: false,
                 rating: 4.8),
        
        MenuItem(category: .entrees,
                 image: "🥩",
                 title: "House Filet",
                 description: "Exceptionally tender center-cut filet grilled with our signature seasoning.",
                 calories: 860,
                 price: 22.79,
                 isFavorite: false,
                 rating: 4.9),
        
        MenuItem(category: .desserts,
                 image: "🍩",
                 title: "Chocolate Dougnut",
                 description: "Dark chocolate dougnut with a warm, fudge center. Served with vanilla bean ice cream.",
                 calories: 1150,
                 price: 8.99,
                 isFavorite: false,
                 rating: 4.8),
        
        MenuItem(category: .drinks,
                 image: "🥤",
                 title: "Strawberry Lemonade",
                 description: "Crisp and delicious.",
                 calories: 200,
                 price: 3.39,
                 isFavorite: false,
                 rating: 4.3),
        
        MenuItem(category: .sides,
                 image: "🥤",
                 title: "Loaded Potato Soup",
                 description: "Creamy potato soup loaded with bacon, cheddar and fresh green onions.",
                 calories: 380,
                 price: 5.99,
                 isFavorite: false,
                 rating: 4.0),
        
        MenuItem(category: .appetizer,
                 image: "🍗",
                 title: "Spicy Chicken Bites",
                 description: "Fresh and tender hand-cut chicken tossed in a sweet and spicy chili-ginger sauce.",
                 calories: 740,
                 price: 6.49,
                 isFavorite: false,
                 rating: 4.8),
        
        MenuItem(category: .entrees,
                 image: "🥩",
                 title: "House Filet",
                 description: "Exceptionally tender center-cut filet grilled with our signature seasoning.",
                 calories: 860,
                 price: 22.79,
                 isFavorite: false,
                 rating: 4.9),
        
        MenuItem(category: .desserts,
                 image: "🍩",
                 title: "Chocolate Dougnut",
                 description: "Dark chocolate dougnut with a warm, fudge center. Served with vanilla bean ice cream.",
                 calories: 1150,
                 price: 8.99,
                 isFavorite: false,
                 rating: 4.8),
        
        MenuItem(category: .drinks,
                 image: "🥤",
                 title: "Strawberry Lemonade",
                 description: "Crisp and delicious.",
                 calories: 200,
                 price: 3.39,
                 isFavorite: false,
                 rating: 4.3),
        
        MenuItem(category: .sides,
                 image: "🥤",
                 title: "Loaded Potato Soup",
                 description: "Creamy potato soup loaded with bacon, cheddar and fresh green onions.",
                 calories: 380,
                 price: 5.99,
                 isFavorite: false,
                 rating: 4.0)
    ]
}


