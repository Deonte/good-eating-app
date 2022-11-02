//
//  MenuView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 8/21/22.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var order: OrderViewModel
    @ObservedObject private var viewModel = MenuViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.getSelectedMenu().isEmpty {
                emptyView
            } else {
                VStack {
                    HeaderView(username: "Deonté", isOnboarding: $viewModel.isOnboarding)
                    VStack {
                        CategorySelectionView(category: $viewModel.category)
                        list
                    }
                }
                .navigationBarHidden(true)
            }
        }
        .sheet(isPresented: $viewModel.isOnboarding) {
            OnboardingView(isOnboarding: $viewModel.isOnboarding)
        }
        .onChange(of: viewModel.category) { _ in
            Task {
                await viewModel.downloadData()
            }
        }
        .alert("Error", isPresented: $viewModel.isDisplayingError, actions: {
            Button("Close", role: .cancel) { }
        }, message: {
            Text(viewModel.lastErrorMessage)
        })
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(order: OrderViewModel())
    }
}



extension MenuView {
    var emptyView: some View {
        VStack {
            HeaderView(username: "Deonté", isOnboarding: $viewModel.isOnboarding)
            CategorySelectionView(category: $viewModel.category)
            
            Spacer()
            
            ProgressView()
                .navigationBarHidden(true)
            
            Spacer()
        }
    }
    
    var list: some View {
        switch viewModel.category {
        case .steaks:
            return MenuList(menu: $viewModel.steaks, order: order)
        case .bbqs:
            return MenuList(menu: $viewModel.bbq, order: order)
        case .drinks:
            return MenuList(menu: $viewModel.drinks, order: order)
        case .pizza:
            return MenuList(menu: $viewModel.pizza, order: order)
        case .burgers:
            return MenuList(menu: $viewModel.burgers, order: order)
        }
    }
}

private struct MenuList: View {
    @Binding var menu: [MenuItem]
    @ObservedObject var order: OrderViewModel
    
    var body: some View {
        List(menu, id: \.id) { item in
            NavigationLink(destination: DetailView(menuItem: item, order: order)) {
                MenuItemCell(menuItem: item)
            }
        }
        .listStyle(.plain)
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
