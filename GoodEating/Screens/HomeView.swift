//
//  HomeView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 8/21/22.
//

import SwiftUI
struct HomeView: View {
    @State private var isOnboarding = false
    @State private var menuItems: [MenuItem] = MockMenu.data

    var body: some View {
        NavigationView {
            VStack {
                HeaderView(username: "Deonté", isOnboarding: $isOnboarding)
                    .padding(.bottom)
                
                VStack {
                    List(menuItems) { item in
                        NavigationLink(destination: DetailView(menuItem: item)) {
                            MenuItemCell(menuItem: item)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $isOnboarding) {
            OnboardingView(isOnboarding: $isOnboarding)
        }
        .onAppear {
            print(MockMenu.data)
        }
        .background(Color(uiColor: .tertiarySystemBackground))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}
