//
//  Response.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/7/22.
//

import Foundation

struct Response: Codable {
    let total: Int
    let result: [MenuItem]
    
    private enum CodingKeys: String, CodingKey {
        case total = "Total Menu"
        case result = "Result"
    }
}

struct MenuItem: Codable, Identifiable {
    let images: [String]
    let id: String
    let menuName: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case images
        case id = "_id"
        case menuName = "menuname"
        case description
    }
}


