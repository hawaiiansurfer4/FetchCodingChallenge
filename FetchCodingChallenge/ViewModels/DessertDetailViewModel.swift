//
//  DessertDetailViewModel.swift
//  FetchCodingChallenge
//
//  Created by Sean Murphy on 7/31/24.
//

import Foundation

class DessertDetailViewModel: ObservableObject {
    var networkManager = NetworkManager()
    @Published var dessertDetailArr = [Meals]()
    
    func fetchDessertDetailData(mealID: String) async {
        let startingURL = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
        do {
            let data = try await networkManager.fetchData(with: startingURL)
            let decoder = JSONDecoder()
            let results = try decoder.decode(DessertDetailModel.self, from: data)
            DispatchQueue.main.async {
                self.dessertDetailArr = results.meals
            }
        } catch {
            print(error)
        }
    }
}
