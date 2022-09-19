//
//  DetailView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/10/22.
//

import SwiftUI

struct DetailView: View {
    @Binding var menuItem: MenuItem
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorites: Favorites
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            Image(menuItem.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: Constants.ScreenSize.height > 667 ? 400 : 300)
                .clipped()
            
            Spacer()
            
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
                
                Button {
                    order.add(menuItem)
                    self.presentationMode.wrappedValue.dismiss() 
                } label: {
                    GEButton(title: "Add to Order")
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom)
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(menuItem.category.description())
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    menuItem.isFavorite.toggle()
                    favorites.add(menuItem)
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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(menuItem: .constant(MockMenu.data[3]))
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

private struct HeaderImageView: View {
    let menuItem: MenuItem
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(maxHeight: Constants.ScreenSize.height / 1.5)
            
            Text(menuItem.image)
                .font(.system(size: Constants.ScreenSize.width / 3))
        }
        .ignoresSafeArea()
        .environmentObject(Order())
    }
}

