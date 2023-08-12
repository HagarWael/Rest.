//
//  MenuItem.swift
//  Restaurant
//
// Created by Hager on 06/08/2023.
//

import Foundation

// Properties correspond to the keys listed in the API
struct MenuItem: Codable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var category: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case category
        case imageURL = "image_url"
    }
}


struct MenuItems: Codable {
    let items: [MenuItem]
}
