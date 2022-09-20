//
//  HomeView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 8/21/22.
//

import SwiftUI
struct HomeView: View {
    @State private var isOnboarding = false
    @State var menuItems: [MenuItem] = MockMenu.data
    
    var body: some View {
        NavigationView {
            if menuItems.isEmpty {
               Text("Loading...")
                    .navigationBarHidden(true)
            } else {
                VStack {
                    HeaderView(username: "Deonté", isOnboarding: $isOnboarding)
                    
                    VStack {
                        List($menuItems, id: \.id) { item in
                            NavigationLink(destination: DetailView(menuItem: item)) {
                                MenuItemCell(menuItem: item)
                            }
                            .id(UUID())
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
        HomeView()
    }
}
