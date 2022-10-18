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
                    color: .orange
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
                GEButton(title: "Continue")
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
    let frame: CGFloat = Constants.ScreenSize.height > 667 ? 200 : 150
    var body: some View {
        VStack {
            Text("Welcome to DK's Kitchen")
                .font(.title)
                .bold()
                        
            ZStack {
                RoundedRectangle(cornerRadius: Constants.ScreenSize.height > 667 ? 40 : 20)
                    .frame(width: self.frame, height: self.frame)
                    .foregroundColor(.white)
                    .shadow(radius: 4)
                
                Text("🥩")
                    .font(.system(size: Constants.ScreenSize.height > 667 ? 130 : 90))
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
