//
//  CategoryView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 11/2/22.
//


import SwiftUI

struct CategoryView: View {
    let category: CourseCategory
 
    var isSelected: Bool
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.clear)
                
                Circle()
                    .frame(width: isSelected ? 60 : 0,
                           height: isSelected ? 60 : 0)
                    .foregroundColor(isSelected ? .orange.opacity(0.4) : .clear)
                
                Text(category.categoryImage)
                    .font(.system(size: 40))
            }
            
            Text(category.description())
                .font(.footnote)
                .foregroundColor(Color(uiColor: .label))
        }
        .frame(maxHeight: 80)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: .bbqs, isSelected: true)
    }
}
