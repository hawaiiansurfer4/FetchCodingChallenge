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
    
    init() {
        Task {
            await fetchDessertData()
        }
    }
    
    func fetchDessertData() async{
        let startingURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        do {
            let data = try await networkManager.fetchData(with: startingURL)
            let decoder = JSONDecoder()
            let results = try decoder.decode(DessertModel.self, from: data)
            DispatchQueue.main.async {
                self.dessertArr = results.meals
            }
        } catch {
            print(error)
        }
    }
}
