//
//  NetworkManager.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/7/22.
//

import SwiftUI

class NetworkManager: ObservableObject {
    @Published var items: [Item] = []
    
    enum NetworkError: Error {
        case invalidResponse
        case responseDecodingFailed
    }
    
    private let session: URLSession
    private let sessionConfiguration: URLSessionConfiguration
    private let url = URL(string: "https://foodbukka.herokuapp.com/api/v1/menu")!
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
                
        guard let menuResponse = try? decoder.decode(Response.self, from: data) else {
            throw NetworkError.responseDecodingFailed
        }
                
        await MainActor.run {
            items = menuResponse.result
        }
    }
    
}


