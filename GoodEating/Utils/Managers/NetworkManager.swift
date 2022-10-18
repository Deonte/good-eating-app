//
//  NetworkManager.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/7/22.
//

import SwiftUI

class NetworkManager: ObservableObject {
    @Published var menu: [MenuItem] = []
    
    enum NetworkError: Error {
        case invalidResponse
        case responseDecodingFailed
        case invalidURL
        case failedToDownloadImage
    }
    
    private let session: URLSession
    private let sessionConfiguration: URLSessionConfiguration
    private let url = URL(string: "https://ig-food-menus.herokuapp.com/best-foods")!
    private let decoder = JSONDecoder()
    
    init() {
        self.sessionConfiguration = URLSessionConfiguration.default
        self.session = URLSession(configuration: sessionConfiguration)
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func downloadMenu() async throws {
        let (data, response) = try await session.data(from: self.url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        guard let menuResponse = try? decoder.decode([MenuItem].self, from: data) else {
            throw NetworkError.responseDecodingFailed
        }
        
        await MainActor.run {
            menu = menuResponse
        }
    }
    
    func downloadMenuAndSaveToJSON() async throws {
        let (data, response) = try await session.data(from: self.url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
                
        guard let menuResponse = try? decoder.decode([MenuItem].self, from: data) else {
            throw NetworkError.responseDecodingFailed
        }
        
        // Save Menu to Menu Store
        MenuJSONStore.shared.write(menuResponse)
        
        await MainActor.run {
            // Load Menu from MenuStore
            menu = MenuJSONStore.shared.readData()
        }
    }
    
    func downloadMenuAndSavePlist() async throws {
        let (data, response) = try await session.data(from: self.url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
                
        guard let menuResponse = try? decoder.decode([MenuItem].self, from: data) else {
            throw NetworkError.responseDecodingFailed
        }
        
        // Save Menu to Property List
        MenuPlistStore.shared.write(menuResponse)
        
        await MainActor.run {
            // Load Menu from Property List
            menu = MenuPlistStore.shared.readData()
        }
    }
    
}


