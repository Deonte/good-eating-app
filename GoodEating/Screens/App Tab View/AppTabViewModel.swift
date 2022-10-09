//
//  AppTabViewModel.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/9/22.
//

import SwiftUI

final class AppTabViewModel: ObservableObject {
    @Published var order = OrderViewModel()
    @Published var favorites = FavoritesViewModel()
    @Published var networkManager = NetworkManager()
    
    func setTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        appearance.backgroundColor = UIColor(Color(uiColor: .systemBackground).opacity(0.2))
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    func animate() {
        
    }
    
    func downloadData() async {
        do {
            try await networkManager.downloadItems()
            print("Downloaded \(networkManager.items.count) menu items.")
            try await networkManager.downloadAndPrintCookies()
        } catch let error {
            print(error)
        }
    }
}
