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
                Text(menuItem.name)
                    .font(.title3)
                    .fontWeight(.medium)
                    .lineLimit(2)
                    .minimumScaleFactor(0.6)

                Text("$\(menuItem.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            if menuItem.rate > 4 {
                Image(systemName: "star.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.yellow)
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
            AsyncImage(url: URL(string: menuItem.img)!) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                @unknown default:
                    EmptyView()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                }
            }
        }
    }
}

