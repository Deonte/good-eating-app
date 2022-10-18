//
//  HomeView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 8/21/22.
//

import SwiftUI

struct HomeView: View {
    @State private var isOnboarding = false
    @MainActor @Binding var menuItems: [MenuItem]
    @ObservedObject var order: OrderViewModel
        
    var body: some View {
        NavigationView {
            if menuItems.isEmpty {
                VStack {
                    HeaderView(username: "Deonté", isOnboarding: $isOnboarding)

                    Spacer()
                    
                    ProgressView()
                        .navigationBarHidden(true)
                    
                    Spacer()
                }
            } else {
                VStack {
                    HeaderView(username: "Deonté", isOnboarding: $isOnboarding)
                    
                    VStack {
                        List(menuItems, id: \.id) { item in
                            NavigationLink(destination: DetailView(menuItem: item, order: order)) {
                                MenuItemCell(menuItem: item)
                            }
                        }
                        .listStyle(.plain)
                    }
                }
                .navigationBarHidden(true)
            }
        }
        .sheet(isPresented: $isOnboarding) {
            OnboardingView(isOnboarding: $isOnboarding)
        }
        .background(
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(menuItems: .constant(MockMenu.data), order: OrderViewModel())
    }
}
