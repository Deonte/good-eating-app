//
//  FavoritesView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/18/22.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        NavigationView {
            if favorites.items.isEmpty {
                EmptyStateView(emoji: "❤️", text: "You haven't favorited anything. Yet...")
                    .navigationTitle("Favorites ❤️")
            } else {
                VStack {
                    List($favorites.items) { item in
                        NavigationLink(destination: DetailView(menuItem: item)) {
                            MenuItemCell(menuItem: item)
                        }
                    }
                    .listStyle(.plain)
                }
                .navigationTitle("Favorites ❤️")
            }
        }
        .background(
            Color(uiColor: .secondarySystemBackground)
        )
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(Favorites())
    }
}

struct EmptyStateView: View {
    let emoji: String
    let text: String
    
    var body: some View {
        VStack(spacing: 12) {
            Text(emoji)
                .font(.system(size: 150))
            
            Text(text)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding(.vertical, 30)
        .padding(.horizontal)
    }
}
