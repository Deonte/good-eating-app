//
//  Menu.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/7/22.
//

import Foundation
import SwiftUI

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

struct MenuItem: Identifiable, Equatable {
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
                 image: "foodiesfeed.com_appetizer-with-toasted-bread-and-whipped-butter",
                 title: "Classic Bread & Butter",
                 description: "Fresh Baked bread serve with a premium whipped butter spread.",
                 calories: 740,
                 price: 8.49,
                 isFavorite: false,
                 rating: 4.8),
        
        MenuItem(category: .appetizer,
                 image: "foodiesfeed.com_easy-gravlax-appetizer",
                 title: "Gravlax",
                 description: "Salmon that is cured using a mix of salt and sugar, with sprucetwigs placed on top.",
                 calories: 450,
                 price: 10.49,
                 isFavorite: false,
                 rating: 4.3),
        
        MenuItem(category: .appetizer,
                 image: "foodiesfeed.com_tasty-chicken-tacos-with-cheese",
                 title: "Tasty Chicken Taco's",
                 description: "Delicious homemade chicken tacos, with a premium blend of cheese's.",
                 calories: 650,
                 price: 9.99,
                 isFavorite: false,
                 rating: 4.9),
        
        MenuItem(category: .drinks,
                 image: "foodiesfeed.com_czech-lager-beer-from-the-tap",
                 title: "Beer",
                 description: "Beer. Enough said.",
                 calories: 250,
                 price: 6.99,
                 isFavorite: false,
                 rating: 4.0),
        
        MenuItem(category: .drinks,
                 image: "foodiesfeed.com_fresh-non-alcoholic-lemon-drink",
                 title: "Orange-Lemonade",
                 description: "A zesty and refreshing drink.",
                 calories: 150,
                 price: 3.49,
                 isFavorite: false,
                 rating: 4.0),
        
        MenuItem(category: .drinks,
                 image: "foodiesfeed.com_frozen-mango-drink-in-a-restaurant",
                 title: "Mango Dango",
                 description: "A refreshing frozen mango suprise.",
                 calories: 200,
                 price: 5.49,
                 isFavorite: false,
                 rating: 4.5),
        
        MenuItem(category: .drinks,
                 image: "foodiesfeed.com_gin-and-tonic-cocktail-with-orange-and-thyme",
                 title: "Orange cocktail",
                 description: "A gin and tonic cocktail with oranges and thyme.",
                 calories: 250,
                 price: 5.49,
                 isFavorite: false,
                 rating: 4.5),
        
        MenuItem(category: .drinks,
                 image: "foodiesfeed.com_homemade-strawberry-and-basil-lemonade",
                 title: "Strawberry Lemonade",
                 description: "Homemade strawberry lemonade.",
                 calories: 300,
                 price: 3.49,
                 isFavorite: false,
                 rating: 4.6),
        
        MenuItem(category: .drinks,
                 image: "foodiesfeed.com_iced-black-coffee-with-golden-spoon",
                 title: "Golden Ice Coffee",
                 description: "Black Iced Coffee. 👀",
                 calories: 100,
                 price: 4.49,
                 isFavorite: false,
                 rating: 3.0),
        
        MenuItem(category: .entrees,
                 image: "foodiesfeed.com_cheese-burger-with-fried-onion-on-a-tray",
                 title: "The Big One",
                 description: "Half pound juicy burger, topped with fried onions.",
                 calories: 1100,
                 price: 15.99,
                 isFavorite: false,
                 rating: 5.0),
        
        MenuItem(category: .entrees,
                 image: "foodiesfeed.com_pizza-with-cheese-and-mushrooms",
                 title: "Mushroom, Salami, & Onion Pizza",
                 description: "Pizza made fresh to order.",
                 calories: 900,
                 price: 14.99,
                 isFavorite: false,
                 rating: 4.0),
        
        MenuItem(category: .entrees,
                 image: "foodiesfeed.com_grilled-beef-steak-with-herbs",
                 title: "Steak",
                 description: "Juicy steak. Enough said.",
                 calories: 600,
                 price: 22.99,
                 isFavorite: false,
                 rating: 5.0),
        
        MenuItem(category: .entrees,
                 image: "foodiesfeed.com_homemade-pizza-with-a-lot-of-cheese",
                 title: "All Cheese Pizza",
                 description: "A delicious cheesy special.",
                 calories: 1340,
                 price: 16.99,
                 isFavorite: false,
                 rating: 3.9),
        
        MenuItem(category: .entrees,
                 image: "foodiesfeed.com_tacos-with-pulled-pork-fresh-vegetables-and-cream",
                 title: "Pulled Pork Taco's",
                 description: "Tasty pulled pork taco's.",
                 calories: 1340,
                 price: 12.99,
                 isFavorite: false,
                 rating: 3.5),
        
        MenuItem(category: .entrees,
                 image: "foodiesfeed.com_pork-ribs-with-knife",
                 title: "Half-Rack BBQ Ribs",
                 description: "Homemade bbq ribs. Enough said.",
                 calories: 1040,
                 price: 18.99,
                 isFavorite: false,
                 rating: 4.7),
        
        MenuItem(category: .sides,
                 image: "foodiesfeed.com_bowl-full-of-fresh-strawberries",
                 title: "Strawberries",
                 description: "Fresh strawberries.",
                 calories: 200,
                 price: 8.99,
                 isFavorite: false,
                 rating: 4.7),
        
        MenuItem(category: .sides,
                 image: "foodiesfeed.com_roasted-potatoes-with-seasoning",
                 title: "Roasted Potatoes",
                 description: "Classic potatoe side dish.",
                 calories: 350,
                 price: 3.99,
                 isFavorite: false,
                 rating: 4.7),
        
        MenuItem(category: .sides,
                 image: "foodiesfeed.com_salad-with-shrimps-and-feta-cheese",
                 title: "Shrimp Salad",
                 description: "A premium shrimp and feta cheese side salad.",
                 calories: 300,
                 price: 9.99,
                 isFavorite: false,
                 rating: 4.7),
        
        MenuItem(category: .sides,
                 image: "foodiesfeed.com_vegan-chickpea-and-potato-curry",
                 title: "Chickpea Curry",
                 description: "A delicious vegan friendly chickpea and potato curry.",
                 calories: 400,
                 price: 6.99,
                 isFavorite: false,
                 rating: 4.1),
        
        MenuItem(category: .desserts,
                 image: "foodiesfeed.com_banana-oat-chocolate-cookies",
                 title: "Banana Oat Chocolate Chip Cookies",
                 description: "Delicious homemade cookies, served with two scoops of ice cream.",
                 calories: 800,
                 price: 8.49,
                 isFavorite: false,
                 rating: 3.8),
        
        MenuItem(category: .desserts,
                 image: "foodiesfeed.com_small-donut-with-raspberry-on-top",
                 title: "Rasberry Donut",
                 description: "Delicious homemade donut, topped with fresh rasberries and whip cream.",
                 calories: 400,
                 price: 5.49,
                 isFavorite: false,
                 rating: 5.0),
        
        MenuItem(category: .desserts,
                 image: "foodiesfeed.com_homemade-blueberry-cake",
                 title: "Blueberry Cake",
                 description: "Delicious homemade blueberry cake. Enough said.",
                 calories: 500,
                 price: 7.99,
                 isFavorite: false,
                 rating: 4.0),
        
        MenuItem(category: .desserts,
                 image: "foodiesfeed.com_carrot-cake-with-fresh-fruits",
                 title: "Carrot Cake",
                 description: "Delicious homemade carrot cake, served with a scoop of ice cream.",
                 calories: 500,
                 price: 8.99,
                 isFavorite: false,
                 rating: 3.5),
        
        MenuItem(category: .desserts,
                 image: "foodiesfeed.com_detail-of-pavlova-strawberry-piece-of-cake",
                 title: "Strawberry Cake",
                 description: "Delicious homemade strawberry cake, served with a scoop of ice cream.",
                 calories: 550,
                 price: 8.99,
                 isFavorite: false,
                 rating: 3.5),
        
        MenuItem(category: .desserts,
                 image: "foodiesfeed.com_fancy-ice-cream-dessert",
                 title: "Fancy Cream",
                 description: "Delicious homemade ice cream.",
                 calories: 300,
                 price: 4.99,
                 isFavorite: false,
                 rating: 3.4),
        
        MenuItem(category: .desserts,
                 image: "foodiesfeed.com_cupcakes-with-fresh-cherries",
                 title: "Cherry Cupcake",
                 description: "Delicious cherry creme filled cupcake.",
                 calories: 400,
                 price: 6.99,
                 isFavorite: false,
                 rating: 4.0),
    ]
}


