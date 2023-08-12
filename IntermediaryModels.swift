//
//  IntermediaryModels.swift
//  Restaurant
//
// Created by Hager on 06/08/2023.
//


struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
