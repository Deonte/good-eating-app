//
//  AppTabView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/18/22.
//

import SwiftUI

struct AppTabView: View {
    @EnvironmentObject var order: Order
    @Binding var menuItems: [MenuItem]
    var body: some View {
        TabView {
            HomeView(menuItems: $menuItems)
                .tabItem {
                    TabLabel(imageName: "menucard.fill",
                             label: "Menu")
                }
            
            FavoritesView()
                .tabItem {
                    TabLabel(imageName: "heart.fill",
                             label: "Favorites")
                }
            
            OrderView()
                .tabItem {
                    TabLabel(imageName: order.items.isEmpty ? "cart" : "cart",
                             label: "Checkout")
                }
                .badge(order.items.count)
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView(menuItems: .constant(MockMenu.data))
            .environmentObject(Order())
    }
}

private struct TabLabel: View {
    let imageName: String
    let label: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(label)
        }
    }
}

