//
//  DetailView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/10/22.
//

import SwiftUI

struct DetailView: View {
    @Binding var menuItem: MenuItem
    @EnvironmentObject var favorites: FavoritesViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                DetailImageView(menuItem: menuItem)
                    .padding(.bottom)
                
                DescriptionView(menuItem: menuItem)
            }
            .padding(.bottom)
            .navigationViewStyle(.stack)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(menuItem.category.description())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if menuItem.isFavorite == false {
                            menuItem.isFavorite = true
                            favorites.add(menuItem)
                        } else {
                            menuItem.isFavorite = false
                            favorites.items.removeLast()
                        }
                       
                    } label: {
                        Image(systemName: "heart.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(menuItem.isFavorite ? .red : .secondary)
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(menuItem: .constant(MockMenu.data[2]))
    }
}

struct GEButton: View {
    var title: String
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text(title)
            .frame(width: Constants.ScreenSize.width - 24, height: 50)
            .font(.headline)
            .foregroundColor(colorScheme == .light ? Color.white: Color.black)
            .background(Color.accentColor)
            .cornerRadius(10)
    }
}


private struct PopularView: View {
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Image(systemName: "star.circle")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 20, height: 20)
                    
                    Text("Popular")
                        .font(.title)
                        .foregroundColor(.yellow)
                }
            }
            .padding(8)
            .background(
                Rectangle()
                    .blur(radius: 20)
                    .cornerRadius(20)
            )
            .padding()
        }
    }
}

private struct DetailImageView: View {
    var menuItem: MenuItem
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(menuItem.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: Constants.ScreenSize.height > 667 ? 380 : 250)
                .clipped()
            
            if menuItem.rating > 4.5 {
                PopularView()
            }
        }
    }
}

struct DescriptionView: View {
    var menuItem: MenuItem
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var order: OrderViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack {
                Text(menuItem.title)
                    .font(.title2)
                    .bold()
                Spacer()
                Text("$\(String(format: "%.2f", menuItem.price))")
                    .font(.title3)
                    .bold()
            }
            
            Text(menuItem.category.description())
                .font(.subheadline)
            
            Text(menuItem.description)
                .padding(.vertical)
            
            Text("\(menuItem.calories) Calories")
                .font(.subheadline)
            
            Spacer()
                .frame(height: Constants.ScreenSize.height > 667 ? 50 : 25)

            Button {
                order.add(menuItem)
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                GEButton(title: "Add to Order")
            }
        }
        .frame(maxWidth: Constants.ScreenSize.width - 24)
        .padding(.horizontal)
    }
}
