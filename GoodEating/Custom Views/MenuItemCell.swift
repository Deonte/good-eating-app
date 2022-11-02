//
//  MenuItemCell.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MenuItemCell: View {
    var menuItem: MenuItem
    @State private var isFavorite = false

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            MenuItemCellImageView(menuItem: menuItem)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(menuItem.name)
                    .font(.title3)
                    .fontWeight(.medium)
                    .lineLimit(2)
                    .minimumScaleFactor(0.6)

                Text("$\(menuItem.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            
            .onAppear {
                isFavorite = PersistenceManager.shared.checkIfFavorite(menuItem.id)
            }
            
            Spacer()
            
            if menuItem.rate > 4 {
                Image(systemName: "star.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.yellow)
            }
            
            if isFavorite {
                Image(systemName: "heart.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.red)
            }
        }
    }
}

struct MenuItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(uiColor: .tertiarySystemBackground)
            MenuItemCell(menuItem: MockMenu.data[0])
        }
    }
}

private struct MenuItemCellImageView: View {

    let menuItem: MenuItem
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: menuItem.img)!)
                .resizable()
                .placeholder(Image(systemName: "photo"))
                .scaledToFill()
                .frame(width: 80, height: 80)
                .cornerRadius(10)
        }
    }
}

