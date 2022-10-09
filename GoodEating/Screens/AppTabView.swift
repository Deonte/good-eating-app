//
//  AppTabView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/18/22.
//

import SwiftUI

struct AppTabView: View {
    @ObservedObject var order = OrderViewModel()
    @ObservedObject var favorites = FavoritesViewModel()
    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        TabView {
            HomeView(favorites: favorites, order: order)
                .tabItem {
                    TabLabel(imageName: "menucard.fill",
                             label: "Menu")
                }
            
            FavoritesView(viewModel: favorites)
                .tabItem {
                    TabLabel(imageName: "heart.fill",
                             label: "Favorites")
                }
            
            OrderView(order: order)
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
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
            
            Task {
                do {
                    try await networkManager.downloadItems()
                    print("Downloaded \(networkManager.items.count) menu items.")
                    try await networkManager.downloadAndPrintCookies()
                } catch let error {
                    print(error)
                }
            }
            
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
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

