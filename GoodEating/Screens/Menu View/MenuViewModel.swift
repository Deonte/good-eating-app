//
//  MenuViewModel.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/26/22.
//

import Foundation

final class MenuViewModel: ObservableObject {
    @Published var menuItems: [MenuItem] = MockMenu.data
    @Published var favorites: [MenuItem] = []
    @Published var order: [MenuItem] = []
    
    var totalPrice: Float {
        order.reduce(0) { $0 + $1.price }
    }
    
    func addToFavorites(_ menuItem: MenuItem) {
        favorites.append(menuItem)
    }
    
    func removeFromFavorites(_ menuItem: MenuItem) {
        if let index = favorites.firstIndex(of: menuItem) {
            favorites.remove(at: index)
        }
    }
    
    func addToOrder(_ menuItem: MenuItem) {
        order.append(menuItem)
    }
    
    func deleteOrderItems(at offesets: IndexSet) {
        order.remove(atOffsets: offesets)
    }
    
}
