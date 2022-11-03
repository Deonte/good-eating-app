//
//  AppTabViewModel.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/9/22.
//

import SwiftUI
import Network

@MainActor
final class AppTabViewModel: ObservableObject {
    @Published var animate = false
    @Published var showSplash = true
    @Published var animationEnded = false
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
    
    func animateSplashScreen() async {
        Task {
            try await Task.sleep(nanoseconds: 300_000_000)
                animate.toggle()
        }
        
        Task {
            try await Task.sleep(nanoseconds: 2_000_000_000)
                showSplash.toggle()
                animationEnded.toggle()
        }
    }
    
}
