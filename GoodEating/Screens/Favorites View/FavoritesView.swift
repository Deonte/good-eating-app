//
//  FavoritesView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/18/22.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel = FavoritesViewModel()
    @ObservedObject var order: OrderViewModel

    @FetchRequest(
        sortDescriptors: [],
      animation: .default)
    var favorites: FetchedResults<FavoriteMenuItem>
    
    var body: some View {
        NavigationView {
            if favorites.isEmpty {
                EmptyStateView(emoji: "❤️", text: "You haven't favorited anything. Yet...")
                    .navigationTitle("Favorites ❤️")
            } else {
                VStack {
                    List {
                        ForEach(favorites) { favorite in
                            NavigationLink(destination: DetailView(menuItem: favorite.convertToMenuItem(), order: order)) {
                                MenuItemCell(menuItem: favorite.convertToMenuItem())
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                let menuItem = favorites[index]
                                PersistenceManager.shared.delete(menuItem)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
                .navigationTitle("Favorites ❤️")
                .onAppear() {
                    favorites.sortDescriptors = viewModel.sortTypes[0].descriptors
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            ForEach(0..<viewModel.sortTypes.count, id: \.self) { index in
                                let sortType = viewModel.sortTypes[index]
                            Button(action: {
                              favorites.sortDescriptors = sortType.descriptors
                            }, label: {
                              Text(sortType.name)
                            })
                          }
                        }
                        label: {
                          Image(systemName: "line.3.horizontal.decrease.circle.fill")
                        }
                    }
                }
            }
        }
        .background(
            Color(uiColor: .secondarySystemBackground)
        )
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(viewModel: FavoritesViewModel(), order: OrderViewModel())
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
