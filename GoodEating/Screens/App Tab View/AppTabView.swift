//
//  AppTabView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/18/22.
//

import SwiftUI

struct AppTabView: View {
    @ObservedObject private var viewModel = AppTabViewModel()
    
    var body: some View {
        ZStack {
            // Content
            ZStack {
                TabView {
                    HomeView(favorites: viewModel.favorites, order: viewModel.order)
                        .tabItem {
                            TabLabel(imageName: "menucard.fill",
                                     label: "Menu")
                        }
                    
                    FavoritesView(viewModel: viewModel.favorites)
                        .tabItem {
                            TabLabel(imageName: "heart.fill",
                                     label: "Favorites")
                        }
                    
                    OrderView(order: viewModel.order)
                        .tabItem {
                            TabLabel(imageName: "cart",
                                     label: "Checkout")
                        }
                        .badge(viewModel.order.items.count)
                }
                .onAppear {
                    viewModel.setTabBarAppearance()
                    Task {
                        await viewModel.downloadData()
                    }
                }
            }
            
            // Splash Screen
            ZStack {
                Color.red
            }
        }
        .onAppear(perform: viewModel.animateSplashScreen)
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

