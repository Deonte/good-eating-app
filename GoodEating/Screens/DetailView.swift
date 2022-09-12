//
//  DetailView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/10/22.
//

import SwiftUI

struct DetailView: View {
    let menuItem: MenuItem
    
    var body: some View {
        VStack(spacing: 8){
            HeaderImageView(menuItem: menuItem)
            
            DescriptionTextView(menuItem: menuItem)
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(menuItem: MockMenu.data[4])
    }
}

private struct GEButton: View {
    var title: String
    
    var body: some View {
        Text(title)
            .frame(width: Constants.ScreenSize.width - 24, height: 50)
            .font(.headline)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(10)
    }
}

private struct HeaderImageView: View {
    let menuItem: MenuItem
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(maxHeight: Constants.ScreenSize.height / 1.5)
                .foregroundColor(menuItem.color.opacity(0.3))
            
            Text(menuItem.image)
                .font(.system(size: Constants.ScreenSize.width / 3))
        }
        .ignoresSafeArea()
    }
}

private struct DescriptionTextView: View {
    let menuItem: MenuItem
    
    var body: some View {
        VStack  {
            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Text(menuItem.title)
                        .font(.title2)
                        .bold()
                    Spacer()
                    Text("$\(String(format: "%.2f", menuItem.price))")
                        .font(.title3)
                        .bold()
                }
                
                Text(menuItem.category.description())
                    .font(.subheadline)
            
                Text(menuItem.description)
                    .padding(.vertical)
                
                Text("\(menuItem.calories) Calories")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button {
                print("Order")
            } label: {
                GEButton(title: "Order")
            }
            
        }
        .padding()
    }
}
