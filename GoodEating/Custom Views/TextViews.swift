//
//  TextViews.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 8/21/22.
//

import SwiftUI

struct HeaderView: View {
    var username: String
    @Binding var isOnboarding: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Hello, \(username) 👋")
                    .font(.title)
                    .fontWeight(.medium)
                Text("it's dinner time!")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button {
                isOnboarding = true
            } label: {
                SymbolView(image: Constants.SFSymbol.user)
            }
        }
        .padding()
    }
}

struct SymbolView: View {
    var image: String
    var color: Color = .accentColor
    
    var body: some View {
        Image(systemName: image)
            .font(.system(size: 30))
            .foregroundColor(color)

    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HeaderView(username: "Deonté", isOnboarding: .constant(false))
        }
    }
}

