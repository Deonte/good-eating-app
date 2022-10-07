//
//  NetworkManager.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/7/22.
//

import SwiftUI

class NetworkManager: ObservableObject {
    @Published var items: [Item] = []
    
    // Assignment 3: Error Handling
    enum NetworkError: Error {
        case invalidResponse
        case responseDecodingFailed
    }
    
    private let session: URLSession
    private let sessionConfiguration: URLSessionConfiguration
    // Assignment 4: ATS
    private let url = URL(string: "http://foodbukka.herokuapp.com/api/v1/menu")!
    private let decoder = JSONDecoder()
    
    init() {
        self.sessionConfiguration = URLSessionConfiguration.default
        self.session = URLSession(configuration: sessionConfiguration)
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func downloadItems() async throws {
        let (data, response) = try await session.data(from: self.url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        // Assignment 2: Download Data
        print("Data Downloaded \(data)")
        
        guard let menuResponse = try? decoder.decode(Response.self, from: data) else {
            throw NetworkError.responseDecodingFailed
        }
                
        await MainActor.run {
            items = menuResponse.result
        }
    }
    
}


