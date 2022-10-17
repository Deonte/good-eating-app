//
//  DetailView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/10/22.
//

import SwiftUI

struct DetailView: View {
    @Binding var menuItem: MenuItem
    @ObservedObject var favorites: FavoritesViewModel
    @ObservedObject var order: OrderViewModel

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                DetailImageView(menuItem: menuItem)
                    .padding(.bottom)
                
                DescriptionView(menuItem: menuItem, order: order)
            }
            .padding(.bottom)
            .navigationViewStyle(.stack)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(menuItem.name)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        switch menuItem.isFavorite {
//                        case true:
//                            menuItem.isFavorite = false
//                            favorites.remove(menuItem: menuItem)
//                        case false:
//                            menuItem.isFavorite = true
//                            favorites.add(menuItem)
//                        }
//                    } label: {
//                        Image(systemName: "heart.circle.fill")
//                            .resizable()
//                            .frame(width: 25, height: 25)
//                            .foregroundColor(menuItem.isFavorite ? .red : .secondary)
//                    }
//                }
//            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(menuItem: .constant(MockMenu.data[2]), favorites: FavoritesViewModel(), order: OrderViewModel())
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
            .cornerRadius(12)
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
                    .foregroundColor(.black)
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
            AsyncImage(url: URL(string: menuItem.img)!) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: Constants.ScreenSize.height > 667 ? 380 : 250)
                        .clipped()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: Constants.ScreenSize.height > 667 ? 380 : 250)
                        .clipped()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: Constants.ScreenSize.height > 667 ? 380 : 250)
                        .clipped()
                        .padding()
                @unknown default:
                    EmptyView()
                        .frame(height: Constants.ScreenSize.height > 667 ? 380 : 250)
                }
            }
            
            if menuItem.rate > 4 {
                PopularView()
            }
        }
    }
}

struct DescriptionView: View {
    var menuItem: MenuItem
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var order: OrderViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack {
                Text(menuItem.name)
                    .font(.title2)
                    .bold()
                Spacer()
                Text("$\(String(format: "%.2f", menuItem.price))")
                    .font(.title3)
                    .bold()
            }
            
            Text(menuItem.dsc)
                .lineLimit(nil)
                .minimumScaleFactor(0.7)
                .padding(.vertical)
            
            Text("Origin: \(menuItem.country)")
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
