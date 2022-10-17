//
//  Favorite.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/18/22.
//

import Foundation
// MVVM
final class FavoritesViewModel: ObservableObject {
    @Published var items: [MenuItem] = []
    
    func add(_ menuItem: MenuItem) {
        items.append(menuItem)
    }
    
    func deleteItems(at offesets: IndexSet) {
        items.remove(atOffsets: offesets)
    }
    
//    func remove(menuItem: MenuItem) {
//        guard let index = items.firstIndex(where: { $0 == menuItem }) else {
//            print("Error deleting")
//            return
//        }
//        items.remove(at: index)
//    }
//    
}
