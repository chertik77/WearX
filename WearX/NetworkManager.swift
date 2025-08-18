//
//  NetworkManager.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://dummyjson.com/products"
    
    private init() {}
    
    func getProducts(completed: @escaping (Result<[Product], WXError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(
            with: URLRequest(url: url)) { data, response, error in
                if let _ = error {
                    completed(.failure(.unableToComplete))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completed(.failure(.invalidResponse))
                    return
                }
                
                guard let data = data else {
                    completed(.failure(.invalidData))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(ProductResponse.self, from: data)
                    completed(.success(decodedResponse.products))
                } catch {
                    completed(.failure(.invalidData))
                }
            }
        
        task.resume()
    }
}
