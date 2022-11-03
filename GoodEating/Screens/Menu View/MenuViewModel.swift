//
//  MenuViewModel.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 11/2/22.
//

import Foundation

@MainActor
final class MenuViewModel: ObservableObject {
    @Published var isOnboarding = false
    @Published var category: CourseCategory = .steaks
    @Published var networkManager = NetworkManager()
    
    @Published var steaks: [MenuItem] = []
    @Published var bbq: [MenuItem] = []
    @Published var drinks: [MenuItem] = []
    @Published var pizza: [MenuItem] = []
    @Published var burgers: [MenuItem] = []
    
    @Published var isDisplayingError = false
    @Published var lastErrorMessage = "" {
      didSet { isDisplayingError = true }
    }
    
    init()  {
        Task {
            await downloadData()
        }
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
    
    func getSelectedMenu() -> [MenuItem] {
        switch category {
        case .steaks:
            return steaks
        case .bbqs:
            return bbq
        case .drinks:
            return drinks
        case .pizza:
            return pizza
        case .burgers:
            return burgers
        }
    }
    
}
