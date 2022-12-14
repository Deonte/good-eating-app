//
//  AppTabView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/18/22.
//

import SwiftUI

struct AppTabView: View {
    @ObservedObject private var viewModel = AppTabViewModel()
    @EnvironmentObject var order: OrderViewModel

    var body: some View {
        ZStack {
            ZStack {
                TabView {
                    MenuView()
                        .tabItem {
                            Label("Menu", systemImage: "menucard.fill")
                        }
                    
                    FavoritesView()
                        .tabItem {
                            Label("Favorites", systemImage: "heart.fill")
                        }
                    
                    OrderView()
                        .tabItem {
                            Label("Order", systemImage: "cart")
                        }
                        .badge(order.items.count)
                }
                .scaleEffect(viewModel.animationEnded ? 1 : 5)
            }
            
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
        .alert("Error", isPresented: $viewModel.isDisplayingError, actions: {
          Button("Close", role: .cancel) { }
        }, message: {
            Text(viewModel.lastErrorMessage)
        })
        .onAppear {
            viewModel.setTabBarAppearance()
        }
        .task {
            await viewModel.animateSplashScreen()
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}

