//
//  NetworkManager.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/7/22.
//

import SwiftUI

class NetworkManager: ObservableObject {
    @Published var items: [MenuItem] = []
    
    enum NetworkError: Error {
        case invalidResponse
        case responseDecodingFailed
        case invalidURL
        case failedToDownloadImage
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
        
        // Assignment 2: Download Data
        print("\nData Downloaded: \(data)")
        
        guard let menuResponse = try? decoder.decode(Response.self, from: data) else {
            throw NetworkError.responseDecodingFailed
        }
        
        await MainActor.run {
            items = menuResponse.result
        }
    }
    
    
    func downloadImage(at url: URL) async throws -> Data {
      let (downloadURL, response) = try await session.download(from: url)

      guard let httpResponse = response as? HTTPURLResponse,
        httpResponse.statusCode == 200
      else {
        throw NetworkError.invalidResponse
      }

      do {
        return try Data(contentsOf: downloadURL)
      } catch {
          throw NetworkError.failedToDownloadImage
      }
    }
    
    
    func downloadAndPrintCookies() async throws {
        func setCookies(name: String, value: String) {
            print("\n------------ C 🍪 🍪 K I E ------------\n")
            print("Name: \(name)\nValue: \(value)")
            print("\n---------------------------------------\n")
        }
        
        guard let url = URL(string: "https://www.raywenderlich.com") else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (_, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  let fields = httpResponse.allHeaderFields as? [String: String],
                  let cookie = HTTPCookie.cookies(withResponseHeaderFields: fields, for: url).first
            else {
                throw NetworkError.invalidResponse
            }
            
            setCookies(name: cookie.name, value: cookie.value)
        } catch {
           throw NetworkError.responseDecodingFailed
        }
    }
    
}


