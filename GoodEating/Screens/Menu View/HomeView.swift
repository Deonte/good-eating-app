//
//  HomeView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 8/21/22.
//

import SwiftUI
@MainActor
struct HomeView: View {
    @State private var isOnboarding = false
    @ObservedObject var order: OrderViewModel
    @State private var category: CourseCategory = .steaks
    @State var networkManager = NetworkManager()
    
    @State var steaks: [MenuItem] = []
    @State var bbq: [MenuItem] = []
    @State var drinks: [MenuItem] = []
    @State var pizza: [MenuItem] = []
    @State var burgers: [MenuItem] = []
    
    @State var isDisplayingError = false
    @State var lastErrorMessage = "" {
      didSet { isDisplayingError = true }
    }
    var body: some View {
        NavigationView {
            if networkManager.menu.isEmpty {
                VStack {
                    HeaderView(username: "Deonté", isOnboarding: $isOnboarding)
                    CategorySelectionView(category: $category)

                    Spacer()
                    
                    ProgressView()
                        .navigationBarHidden(true)
                    
                    Spacer()
                }
            } else {
                VStack {
                    HeaderView(username: "Deonté", isOnboarding: $isOnboarding)

                    VStack {
                        CategorySelectionView(category: $category)
                        switch self.category {
                        case .steaks:
                            List(steaks, id: \.id) { item in
                                NavigationLink(destination: DetailView(menuItem: item, order: order)) {
                                    MenuItemCell(menuItem: item)
                                }
                            }
                            .listStyle(.plain)
                        case .bbqs:
                            List(bbq, id: \.id) { item in
                                NavigationLink(destination: DetailView(menuItem: item, order: order)) {
                                    MenuItemCell(menuItem: item)
                                }
                            }
                            .listStyle(.plain)
                        case .drinks:
                            List(drinks, id: \.id) { item in
                                NavigationLink(destination: DetailView(menuItem: item, order: order)) {
                                    MenuItemCell(menuItem: item)
                                }
                            }
                            .listStyle(.plain)
                        case .pizza:
                            List(pizza, id: \.id) { item in
                                NavigationLink(destination: DetailView(menuItem: item, order: order)) {
                                    MenuItemCell(menuItem: item)
                                }
                            }
                            .listStyle(.plain)
                        case .burgers:
                            List(burgers, id: \.id) { item in
                                NavigationLink(destination: DetailView(menuItem: item, order: order)) {
                                    MenuItemCell(menuItem: item)
                                }
                            }
                            .listStyle(.plain)
                        }
                    }
                }
                .navigationBarHidden(true)
            }
        }
        .sheet(isPresented: $isOnboarding) {
            OnboardingView(isOnboarding: $isOnboarding)
        }
        .background(
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()
        )
        .onChange(of: category) { newValue in
            Task {
                await downloadData()
            }
        }
        .task {
            await downloadData()
        }
        .alert("Error", isPresented: $isDisplayingError, actions: {
          Button("Close", role: .cancel) { }
        }, message: {
            Text(lastErrorMessage)
        })
    }
    
    func downloadData() async {
        do {
            switch category {
            case .steaks:
                guard steaks.isEmpty else { return }
                try await networkManager.downloadMenu(category: .steaks)
                steaks = networkManager.menu
            case .bbqs:
                guard bbq.isEmpty else { return }
                try await networkManager.downloadMenu(category: .bbqs)
                bbq = networkManager.menu
            case .drinks:
                guard drinks.isEmpty else { return }
                try await networkManager.downloadMenu(category: .drinks)
                drinks = networkManager.menu
            case .pizza:
                guard pizza.isEmpty else { return }
                try await networkManager.downloadMenu(category: .pizza)
                pizza = networkManager.menu
            case .burgers:
                guard burgers.isEmpty else { return }
                try await networkManager.downloadMenu(category: .burgers)
                burgers = networkManager.menu
            }
        } catch {
           lastErrorMessage = error.localizedDescription
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(order: OrderViewModel())
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
