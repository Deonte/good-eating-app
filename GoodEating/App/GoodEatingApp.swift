//
//  GoodEatingApp.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 8/21/22.
//

import SwiftUI

@main
struct GoodEatingApp: App {
    @StateObject private var persistenceManager = PersistenceManager.shared
    
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environment(\.managedObjectContext, persistenceManager.container.viewContext)
        }
    }
}
