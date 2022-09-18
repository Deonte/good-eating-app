//
//  MenuItemCell.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/10/22.
//

import SwiftUI

struct MenuItemCell: View {
    var menuItem: MenuItem
    
    var body: some View {
        HStack(spacing: 12) {
            MenuItemCellImageView(menuItem: menuItem)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(menuItem.title)
                    .bold()
                Text(menuItem.category.description())
            }
            
            Spacer()
        }
        .padding(.horizontal)
        
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
            Rectangle()
                .frame(width: 60, height: 60)
                .cornerRadius(10)
                .foregroundColor(menuItem.color.opacity(0.3))
            
            Text(menuItem.image)
                .font(.system(size: 30))
        }
    }
}
