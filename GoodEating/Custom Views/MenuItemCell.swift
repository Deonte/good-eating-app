//
//  MenuItemCell.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/10/22.
//

import SwiftUI

struct MenuItemCell: View {
    var menuItem: MenuItem
    let randomColor: [Color] = [.red, .orange, .green, .blue, .brown, .cyan, .mint, .teal]
    
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Rectangle()
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                    .foregroundColor(randomColor.randomElement()?.opacity(0.3))
                
                Text(menuItem.image)
                    .font(.system(size: 30))
            }
            
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


//private struct BookRow: View {
//    @ObservedObject var book: Book
//    @EnvironmentObject var library: Library
//    
//    var body: some View {
//        NavigationLink(destination: DetailView(book: book)) {
//            HStack(alignment: .center) {
//                Book.Image(image: library.images[book],title: book.title, size: 80, cornerRadius: 12)
//                
//                VStack(alignment: .leading) {
//                    TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
//                    
//                    Text(book.microReview)
//                        .font(.footnote)
//                        .foregroundColor(.secondary)
//                }
//                .lineLimit(1)
//            }
//            
//        }
//        .padding(.vertical)
//    }
//}


//
//protocol Menu {
//    var category: CourseCategory { get }
//    var image: String { get }
//    var title: String { get }
//    var description: String { get }
//    var calories: Int { get }
//    var price: Float { get }
//    var isFavorite: Bool { get set }
//    var rating: Float { get }
//}
