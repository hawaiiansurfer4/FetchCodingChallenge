//
//  DessertDetailModel.swift
//  FetchCodingChallenge
//
//  Created by Sean Murphy on 7/31/24.
//

import Foundation

struct DessertDetailModel: Codable {
    let meals: [Meals]
}

struct Meals: Codable, Identifiable {
    let id: String
    let name: String
    let instructions: String
    let pic: String
    let ingredint1: String
    let ingredint2: String?
    let ingredint3: String?
    let ingredint4: String?
    let ingredint5: String?
    let ingredint6: String?
    let ingredint7: String?
    let ingredint8: String?
    let ingredint9: String?
    let ingredint10: String?
    let ingredint11: String?
    let ingredint12: String?
    let ingredint13: String?
    let ingredint14: String?
    let ingredint15: String?
    let ingredint16: String?
    let ingredint17: String?
    let ingredint18: String?
    let ingredint19: String?
    let ingredint20: String?
    let measure1: String
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    let measure11: String?
    let measure12: String?
    let measure13: String?
    let measure14: String?
    let measure15: String?
    let measure16: String?
    let measure17: String?
    let measure18: String?
    let measure19: String?
    let measure20: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        case pic = "strMealThumb"
        case ingredint1 = "strIngredient1"
        case ingredint2 = "strIngredient2"
        case ingredint3 = "strIngredient3"
        case ingredint4 = "strIngredient4"
        case ingredint5 = "strIngredient5"
        case ingredint6 = "strIngredient6"
        case ingredint7 = "strIngredient7"
        case ingredint8 = "strIngredient8"
        case ingredint9 = "strIngredient9"
        case ingredint10 = "strIngredient10"
        case ingredint11 = "strIngredient11"
        case ingredint12 = "strIngredient12"
        case ingredint13 = "strIngredient13"
        case ingredint14 = "strIngredient14"
        case ingredint15 = "strIngredient15"
        case ingredint16 = "strIngredient16"
        case ingredint17 = "strIngredient17"
        case ingredint18 = "strIngredient18"
        case ingredint19 = "strIngredient19"
        case ingredint20 = "strIngredient20"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
    }
    
    func getIngredientsAndMeasures() -> [(String, String)] {
        let mirror = Mirror(reflecting: self)
        var ingredientsAndMeasures = [(String, String)]()
        
        for i in 1...20 {
            if let ingredient = mirror.children.first(where: { $0.label == "ingredint\(i)" })?.value as? String,
               let measure = mirror.children.first(where: { $0.label == "measure\(i)" })?.value as? String,
               !ingredient.isEmpty,
               !measure.isEmpty {
                ingredientsAndMeasures.append((ingredient, measure))
            }
        }
        
        return ingredientsAndMeasures
    }
}
