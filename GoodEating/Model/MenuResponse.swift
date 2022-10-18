//
//  MenuResponse.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/16/22.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    let id: String
    let img: String
    let name: String
    let dsc: String
    let price: Float
    let rate: Float
    let country: String
}

struct MockMenu {
    static let data =
    [
        MenuItem(id: "bo-ssam-dinner-for-4-6",
                 img: "https://goldbelly.imgix.net/uploads/showcase_media_asset/image/110906/bo-ssam-dinner-for-4.c4a32e8801e2f0283e0565bbe8493149.jpg?ixlib=react-9.0.2&auto=format&ar=1%3A1",
                 name: "Momofuku",
                 dsc: "Half Bo Ssäm Dinner for 4-6",
                 price: 169,
                 rate: 4,
                 country: "New York, NY"
                ),
        MenuItem(id: "legendary-seafood-gumbo",
                 img: "https://goldbelly.imgix.net/uploads/showcase_media_asset/image/133100/legendary-seafood-gumbo.a4010efb8ba0569ff59d68c3723f0963.jpg?ixlib=react-9.0.2&auto=format&ar=1%3A1",
                 name: "Commander's Palace",
                 dsc: "Legendary Seafood Gumbo",
                 price: 89,
                 rate: 4,
                 country: "New Orleans, LA"
                )
    ]
}
