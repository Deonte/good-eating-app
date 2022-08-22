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
                Text("Welcome,")
                    .font(.title)
                    .fontWeight(.bold)
                Text(username)
                    .font(.title)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button {
                isOnboarding = true
            } label: {
                SymbolView(image: Constants.SFSymbol.sheet)
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
            .font(.system(size: 40))
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

