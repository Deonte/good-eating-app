//
//  AppTabView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/18/22.
//

import SwiftUI

struct AppTabView: View {
    @EnvironmentObject var order: OrderViewModel
    
    var body: some View {
        TabView {
            HomeView()
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
                    TabLabel(imageName: "cart",
                             label: "Checkout")
                }
                .badge(order.items.count)
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(Color(uiColor: .systemBackground).opacity(0.2))
            
            // Use this appearance when scrolling behind the TabView:
            UITabBar.appearance().standardAppearance = appearance
            // Use this appearance when scrolled all the way up:
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }

    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
            .environmentObject(OrderViewModel())
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

