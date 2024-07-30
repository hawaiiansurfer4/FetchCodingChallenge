//
//  DessertViewModel.swift
//  FetchCodingChallenge
//
//  Created by Sean Murphy on 7/25/24.
//

import Foundation

class DessertViewModel: ObservableObject {
    var networkManager = NetworkManager()
    @Published var dessertArr = [Meal]()
    
    func fetchDessertData() {
        let startingURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        networkManager.fetchData(with: startingURL) { data, error in
            if let _ = error {
                print(error)
            }
            
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let results = try decoder.decode(DessertModel.self, from: data)
                    DispatchQueue.main.async {
                        self.dessertArr = results.meals
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}
