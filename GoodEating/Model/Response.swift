//
//  Response.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/7/22.
//

import Foundation

struct Response: Codable {
    let result: [Item]
}

struct Item: Codable, Identifiable {
    let images: [String]
    let id: String
    let menuName: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case images
        case menuName = "menuname"
        case description
    }
}


