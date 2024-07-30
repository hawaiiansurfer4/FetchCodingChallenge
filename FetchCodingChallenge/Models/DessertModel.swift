//
//  DessertModel.swift
//  FetchCodingChallenge
//
//  Created by Sean Murphy on 7/25/24.
//

import Foundation

struct DessertModel: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Identifiable {
    let id: String
    let meal: String
    let pic: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case meal = "strMeal"
        case pic = "strMealThumb"
    }
}
