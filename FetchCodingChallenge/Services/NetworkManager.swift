//
//  NetworkManager.swift
//  FetchCodingChallenge
//
//  Created by Sean Murphy on 7/25/24.
//

import Foundation

class NetworkManager: ObservableObject {
    
    func fetchData(with urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
            
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
            return data
        } else {
            throw URLError(.badServerResponse)
        }
    }
}
