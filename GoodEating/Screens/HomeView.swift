//
//  HomeView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 8/21/22.
//

import SwiftUI

struct HomeView: View {
    @State private var isOnboarding = false
    @State private var category: CourseCategory = .appetizer
    
    var body: some View {
        VStack {
            HeaderView(username: "Deonté", isOnboarding: $isOnboarding)
                .padding(.bottom)
            CategorySelectionView(category: $category)
            
            Spacer()
        }
        .sheet(isPresented: $isOnboarding) {
            OnboardingView(isOnboarding: $isOnboarding)
        }
        .onAppear {
            print(MockMenu.data)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}

private struct CategorySelectionView: View {
    @Binding var category: CourseCategory
    
    var body: some View {
        VStack {
            HStack {
                Text("Choose Category")
                    .font(.title2)
                    .fontWeight(.medium)
                Spacer()
            }
            .padding(.horizontal)
            
            HStack(spacing: 12){
                ForEach(CourseCategory.allCases, id: \.self) { category in
                    Button {
                        withAnimation {
                            self.category = category
                        }
                    } label: {
                        CategoryView(category: category,
                                     isSelected: self.category == category ? true : false)
                    }
                }
            }
        }
    }
}
