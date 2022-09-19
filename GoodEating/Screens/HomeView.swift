//
//  HomeView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 8/21/22.
//

import SwiftUI
struct HomeView: View {
    @State private var isOnboarding = false
    @Binding var menuItems: [MenuItem]
    
    var body: some View {
        NavigationView {
            if menuItems.isEmpty {
               Text("Loading...")
                    .navigationBarHidden(true)
            } else {
                VStack {
                    HeaderView(username: "Deonté", isOnboarding: $isOnboarding)
                    
                    VStack {
                        List($menuItems) { item in
                            NavigationLink(destination: DetailView(menuItem: item)) {
                                MenuItemCell(menuItem: item)
                            }
                        }
                        .listStyle(.plain)
                    }
                }
                .navigationBarHidden(true)
            }
        }
        .onAppear {
            menuItems = MockMenu.data
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
        HomeView(menuItems: .constant(MockMenu.data))
    }
}
