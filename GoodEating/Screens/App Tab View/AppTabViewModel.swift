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
    
    init() {
        monitorNetwork()
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
//            await MainActor.run {
                animate.toggle()
//            }
        }
        
        Task {
            try await Task.sleep(nanoseconds: 2_000_000_000)
//            await MainActor.run {
                showSplash.toggle()
                animationEnded.toggle()
//            }
        }
    }
    
//    func downloadData() async {
//        guard menu.isEmpty else { return }
//        do {
//            try await networkManager.downloadMenu(category: )
////            await MainActor.run {
//                menu = networkManager.menu
////            }
//        } catch let error {
//            await MainActor.run {
//                lastErrorMessage = error.localizedDescription
//            }
//        }
//    }
    
//    func downloadDataAndLoadJSON() async {
//        guard menu.isEmpty else { return }
//        do {
//            try await networkManager.downloadMenuAndSaveToJSON()
////            await MainActor.run {
//                menu = MenuJSONStore.shared.readData()
////            }
//        } catch let error {
////            await MainActor.run {
//                lastErrorMessage = error.localizedDescription
//
////            }
//        }
//    }
    
    func monitorNetwork() {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                guard self.menu.isEmpty else { return }
                Task {
                    self.isDisplayingError = false
                   // await self.downloadData()
                }
            } else {
                Task {
                   // await MainActor.run {
                        self.lastErrorMessage = "Could not connect to server. Please check internet connection."
                    //}
                }
            }
        }
    }
    
}
