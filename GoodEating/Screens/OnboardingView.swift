//
//  OnboardingView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 8/21/22.
//

import SwiftUI
struct OnboardingView: View {
    @Binding var isOnboarding: Bool
    
    var body: some View {
        VStack {
            OnboardingHeaderView()
            
            Spacer()

            VStack(alignment: .leading) {
                FeatureView(
                    image: Constants.SFSymbol.menu,
                    title: "Sustainable Digital Menu",
                    detail: "Stop printing every time you add a new menu item or want to change a price. ",
                    color: .blue
                )

                FeatureView(
                    image: Constants.SFSymbol.star,
                    title: "Influence The Menu",
                    detail: "The power of your reviews help fellow customers while also giving the kitchen helpful feedback.",
                    color: .accentColor
                )

                FeatureView(
                    image: Constants.SFSymbol.creditCard,
                    title: "Paperless Ordering & Payment",
                    detail: "Cut your costs with replacing paper menus and bills with digital menus and secure checkout for every order.",
                    color: .green
                )

            }
            .frame(maxWidth: 500)
            .padding(.horizontal)
            
            Spacer()

            Button {
                isOnboarding = false
            } label: {
                Text("Continue")
                    .bold()
                    .padding()
                    .frame(maxWidth: 400)
                    .frame(maxHeight: 50)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
        }
    }
}

struct FeatureView: View {
    var image: String
    var title: String
    var detail: String
    var color: Color = .accentColor
    
    @Environment(\.verticalSizeClass) var sizeClass

    var body: some View {
        HStack(spacing: 16) {
            SymbolView(image: image, color: color)
                .frame(width: 50, height: 50)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .bold()
                
                Text(detail)
                    .font(.footnote)
                    .lineLimit(3)
            }
            .frame(maxHeight: sizeClass == .regular ? 100 : 70)
        }
    }
}

struct OnboardingHeaderView: View {
    var body: some View {
        HStack {
            Text("Welcome to Good Eating")
                .font(.title)
                .bold()
            
           Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 13)
                    .frame(width: 60, height: 60)
                    .foregroundColor(.orange)
                Text("🍑")
                    .font(.system(size: 35))
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView(isOnboarding: .constant(true))
                .previewInterfaceOrientation(.portrait)
            
            OnboardingView(isOnboarding: .constant(true))
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
