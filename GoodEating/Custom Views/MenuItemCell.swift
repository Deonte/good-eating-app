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
                Text(menuItem.menuName)
                    .font(.title3)
                    .fontWeight(.medium)
                
//                Text("$\(menuItem.price, specifier: "%.2f")")
//                    .foregroundColor(.secondary)
//                    .fontWeight(.semibold)
            }
            
            Spacer()
            
//            if menuItem.rating > 4.5 {
//                Image(systemName: "star.circle.fill")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .foregroundColor(.yellow)
//            }
            
//            if menuItem.isFavorite {
//                Image(systemName: "heart.circle.fill")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .foregroundColor(.red)
//            }
        }
    }
}

struct MenuItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(uiColor: .tertiarySystemBackground)
            MenuItemCell(menuItem: .constant(MockMenu.data[0]))
        }
    }
}

private struct MenuItemCellImageView: View {

    let menuItem: MenuItem
    @ObservedObject var networkManager = NetworkManager()
    @MainActor @State var menuImage = UIImage()
    
    var body: some View {
        ZStack {
            Image(uiImage: menuImage)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .cornerRadius(10)
                .onAppear {
                    Task {
                        await downloadImage()
                    }
                }
        }
    }
    
    private func downloadImage() async {
        guard let imageURL = URL(string: menuItem.images[0]) else {
            return
        }
        
        do {
            let data = try await networkManager.downloadImage(at: imageURL)
            guard let image = UIImage(data: data) else { return }
            
            self.menuImage = image
        } catch {
            print(error)
        }
    }
}
