//
//  GoodEatingApp.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 8/21/22.
//

import SwiftUI

@main
struct GoodEatingApp: App {
    @State var menu = MockMenu.data
    
    var body: some Scene {
        WindowGroup {
            AppTabView(menuItems: $menu)
                .environmentObject(Order())
                .environmentObject(Favorites())
        }
    }
}
