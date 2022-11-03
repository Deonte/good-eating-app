//
//  Order.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/7/22.
//

import Foundation
import SwiftUI

final class OrderViewModel: ObservableObject {
    @Published var items: [MenuItem] = []
    @Published var isDisplayingAlert = false
    @Published var lastAlertMessage = "" {
      didSet { isDisplayingAlert = true }
    }
    
    var totalPrice: Float {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ menuItem: MenuItem) {
        items.append(menuItem)
    }
    
    func deleteItems(at offesets: IndexSet) {
        items.remove(atOffsets: offesets)
    }
    
    func placeOrder() {
        isDisplayingAlert = true
        items = []
    }
}


