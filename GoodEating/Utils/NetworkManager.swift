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
    }
    
    private let session: URLSession
    private let sessionConfiguration: URLSessionConfiguration
    
    private let url = "https://foodbukka.herokuapp.com/api/v1/menu"
    
    init() {
        self.sessionConfiguration = URLSessionConfiguration.default
        self.session = URLSession(configuration: sessionConfiguration)
    }
    
    func downloadItems() async throws {
    }
}


