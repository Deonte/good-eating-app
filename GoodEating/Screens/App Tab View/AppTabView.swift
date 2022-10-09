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
            }
            
            // Splash Screen
            ZStack {
                Color(uiColor: .secondarySystemBackground)
                
                Image("steak")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 85, height: 85)
                    .rotationEffect(Angle(degrees: viewModel.animate ? 360 : 0))
                    .scaleEffect(viewModel.animate ? 3 : 1)
                    .animation(.spring(response: 0.7, dampingFraction: 0.5, blendDuration: 0.5), value: viewModel.animate)
                    .opacity(viewModel.animationEnded ? 0 : 1)
                
                Text("DK's Kitchen")
                    .font(.largeTitle.bold())
                    .opacity(viewModel.animate ? 1 : 0)
                    .offset(y: viewModel.animate ? 150 : 100)
                    .animation(.easeInOut(duration: 0.7), value: viewModel.animate)
                
            }
            .ignoresSafeArea()
            .opacity(viewModel.animationEnded ? 0 : 1)
            .scaleEffect(viewModel.showSplash ? 1 : 5)
            .animation(.easeIn(duration: 0.4), value: viewModel.showSplash)
        }
        .onAppear {
            viewModel.setTabBarAppearance()
            viewModel.animateSplashScreen()
            Task {
                await viewModel.downloadData()
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

