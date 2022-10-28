//
//  AppTabViewModel.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/9/22.
//

import SwiftUI

final class AppTabViewModel: ObservableObject {
    @Published var order = OrderViewModel()
    @Published var networkManager = NetworkManager()
    
    @Published var animate = false
    @Published var showSplash = true
    @Published var animationEnded = false
    
    @Published var menu: [MenuItem] = MenuJSONStore.shared.readData()

    @Published var isDisplayingError = false
    @Published var lastErrorMessage = "" {
      didSet { isDisplayingError = true }
    }
    
    func setTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        appearance.backgroundColor = UIColor(Color(uiColor: .systemBackground).opacity(0.2))
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    func animateSplashScreen() async throws {
        Task {
            try await Task.sleep(nanoseconds: 300_000_000)
            await  MainActor.run {
                animate.toggle()
            }
        }
        
        Task {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            await MainActor.run {
                showSplash.toggle()
                animationEnded.toggle()
            }
        }
    }
    
    func downloadData() async {
        guard menu.isEmpty else { return }
        do {
            try await networkManager.downloadMenu()
            await MainActor.run {
                menu = networkManager.menu
            }
        } catch let error {
            await MainActor.run { lastErrorMessage = error.localizedDescription }
        }
    }
    
    func downloadDataAndLoadJSON() async {
        guard menu.isEmpty else { return }
        do {
            try await networkManager.downloadMenuAndSaveToJSON()
            await MainActor.run {
                menu = MenuJSONStore.shared.readData()
            }
        } catch let error {
            await MainActor.run { lastErrorMessage = error.localizedDescription }
        }
    }
    
}
