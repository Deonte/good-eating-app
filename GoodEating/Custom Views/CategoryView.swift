//
//  CategoryView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/10/22.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.orange.opacity(0.4))
                
                Text("🥩")
                    .font(.system(size: 40))
            }
            
            Text("Entrees")
                .font(.footnote)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
//            .previewLayout(.fixed(width: 100, height: 100))
    }
}
