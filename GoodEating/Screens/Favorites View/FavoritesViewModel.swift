//
//  Favorite.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/18/22.
//

import Foundation
import CoreData

final class FavoritesViewModel: ObservableObject {
    @Published var activeSortIndex = 0
    
    let sortTypes = [
      (name: "Name",
       descriptors: [SortDescriptor(\FavoriteMenuItem.name, order: .forward)]
      ),
      (
        name: "Rating",
        descriptors: [SortDescriptor(\FavoriteMenuItem.rate, order: .reverse)]
      ),
       (
        name: "Price",
        descriptors: [SortDescriptor(\FavoriteMenuItem.price, order: .reverse)]
       )
    ]
}

