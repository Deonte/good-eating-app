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
    @State private var menuItems: [MenuItem] = MockMenu.data
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(username: "Deonté", isOnboarding: $isOnboarding)
                    .padding(.bottom)
                CategorySelectionView(category: $category)
                    .padding(.bottom, 20)
                Spacer()
                
                VStack {
                    List {
                        ForEach(menuItems) { item in
                            NavigationLink(destination: DetailView(menuItem: item)) {
                                MenuItemCell(menuItem: item)
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $isOnboarding) {
            OnboardingView(isOnboarding: $isOnboarding)
        }
        .onAppear {
            print(MockMenu.data)
        }
        .background(Color(uiColor: .tertiarySystemBackground))
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
