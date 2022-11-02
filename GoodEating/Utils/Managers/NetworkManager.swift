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
    // Changed URL do to server going down.
    //private let url = URL(string: "https://www.compilery.io/DK'sKitchen/menu.json")!
    private let decoder = JSONDecoder()
//    private let category: CourseCategory
    
    init() {
        self.sessionConfiguration = URLSessionConfiguration.default
        self.session = URLSession(configuration: sessionConfiguration)
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func downloadMenu(category: CourseCategory) async throws {
        let (data, response) = try await session.data(from: category.categoryURL())
        
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
    
//    func downloadMenuAndSaveToJSON() async throws {
//        let (data, response) = try await session.data(from: self.url)
//        
//        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//            throw NetworkError.invalidResponse
//        }
//                
//        guard let menuResponse = try? decoder.decode([MenuItem].self, from: data) else {
//            throw NetworkError.responseDecodingFailed
//        }
//        
//        // Save Menu to Menu Store
//        MenuJSONStore.shared.write(menuResponse)
//    }
    
}


