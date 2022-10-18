//
//  MenuJSONStore.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/17/22.
//

import Foundation

final class MenuJSONStore {
    
    static let shared = MenuJSONStore()
    private init() { }
    
    func write(_ menu: [MenuItem]) {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("menu.json")
            
            try JSONEncoder()
                .encode(menu)
                .write(to: fileURL)
            print("Succesfully Saved JSON!")
        } catch {
            print("Error writing json data.")
        }
    }
    
    func readData() -> [MenuItem] {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("menu.json")
            
            let data = try Data(contentsOf: fileURL)
            let menu = try JSONDecoder().decode([MenuItem].self, from: data)
            
            print("Succesfully Decoded JSON!")
            return menu
        } catch {
            print("Error reading json data.")
            
            return []
        }
    }
    
}

