//
//  Category.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 11/2/22.
//

import Foundation

enum CourseCategory: CaseIterable {
    case steaks
    case bbqs
    case drinks
    case pizza
    case burgers
   
    var categoryImage: String {
        switch self {
        case .steaks:
            return "🥩"
        case .bbqs:
            return "🍖"
        case .drinks:
            return "🍻"
        case .pizza:
            return "🍕"
        case .burgers:
            return "🍔"
        }
    }
    
    func description() -> String {
        switch self {
        case .steaks:
            return "Steaks"
        case .bbqs:
            return "BBQ"
        case .drinks:
            return "Drinks"
        case .pizza:
            return "Desserts"
        case .burgers:
            return "Burgers"
        }
    }
    
    func categoryURL() -> URL {
        switch self {
        case .steaks:
            return URL(string: "https://ig-food-menus.herokuapp.com/steaks")!
        case .bbqs:
            return URL(string: "https://ig-food-menus.herokuapp.com/bbqs")!
        case .drinks:
            return URL(string: "https://ig-food-menus.herokuapp.com/drinks")!
        case .pizza:
            return URL(string: "https://ig-food-menus.herokuapp.com/pizzas")!
        case .burgers:
            return URL(string: "https://ig-food-menus.herokuapp.com/burgers")!
        }
    }
    
}
