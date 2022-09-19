//
//  MenuItemCell.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/10/22.
//

import SwiftUI

struct MenuItemCell: View {
    @Binding var menuItem: MenuItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            MenuItemCellImageView(menuItem: menuItem)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(menuItem.title)
                    .font(.title3)
                    .fontWeight(.medium)
                
                Text("$\(menuItem.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            if menuItem.rating > 4.5 {
                Image(systemName: "star.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.yellow)
            }
            
            if menuItem.isFavorite {
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
            MenuItemCell(menuItem: .constant(MockMenu.data[4]))
        }
    }
}

private struct MenuItemCellImageView: View {
    let menuItem: MenuItem

    var body: some View {
        ZStack {
            Image(menuItem.image)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
        }
    }
}
