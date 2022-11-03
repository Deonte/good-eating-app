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
    private let decoder = JSONDecoder()
    
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
    
}


