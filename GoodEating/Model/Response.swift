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

struct Item: Codable {
    let images: [String]
    let id: String
    let menuName: String
    let description: String
}
