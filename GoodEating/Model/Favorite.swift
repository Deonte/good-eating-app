//
//  Favorite.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/18/22.
//

import Foundation

final class Favorites: ObservableObject {
    @Published var items: [MenuItem] = []
    
    func add(_ menuItem: MenuItem) {
        items.append(menuItem)
    }
    
    func deleteItems(at offesets: IndexSet) {
        items.remove(atOffsets: offesets)
    }
    
}
