//
//  MenuPlistStore.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/17/22.
//

import Foundation

final class MenuPlistStore {
    
    static let shared = MenuPlistStore()
    private init() { }
    
    func write(_ menu: [MenuItem]) {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("menu.plist")
            
            try PropertyListEncoder()
                .encode(menu)
                .write(to: fileURL)
            print("Succesfully Saved Plist!")
        } catch {
            print("Error writing plist data.")
        }
    }
    
    func readData() -> [MenuItem] {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("menu.plist")
            
            let data = try Data(contentsOf: fileURL)
            let menu = try PropertyListDecoder().decode([MenuItem].self, from: data)
            
            print("Succesfully Decoded Plist!")
            return menu
        } catch {
            print("Error reading Plistdata.")
            
            return []
        }
    }
    
}

