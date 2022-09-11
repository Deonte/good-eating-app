//
//  CategoryView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/10/22.
//

import SwiftUI

struct CategoryView: View {
    let category: CourseCategory
    var categoryImage: String {
        switch category {
        case .appetizer:
            return "🧆"
        case .entrees:
            return "🥩"
        case .drinks:
            return "🍻"
        case .desserts:
            return "🧁"
        case .sides:
            return "🍛"
        }
    }
    var isSelected: Bool
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(isSelected ? .orange.opacity(0.4) : .clear)
                
                Text(categoryImage)
                    .font(.system(size: 40))
            }
            
            Text(category.description())
                .font(.footnote)
                .foregroundColor(Color(uiColor: .label))
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: .entrees, isSelected: true)
    }
}
