//
//  NetworkManager.swift
//  FetchCodingChallenge
//
//  Created by Sean Murphy on 7/25/24.
//

import Foundation

class NetworkManager: ObservableObject {
    
    func fetchData(with urlString: String, completion: @escaping (Data?, Error?) -> () ) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest.init(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let objError = error {
                completion(nil, objError)
            }
            
            if let objData = data, let objResp = response as? HTTPURLResponse {
                if objResp.statusCode == 200 {
                    completion(objData, nil)
                } else {
                    completion(nil, error)
                }
            }
        }
        .resume()
    }
}
