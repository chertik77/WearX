//
//  ProductListViewModel.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import Foundation
import Observation

@Observable @MainActor final class ProductListViewModel {
    var products: [Product] = []
    
    var activeAlert: AlertState?
    var isAlertPresented = false
    
    var selectedProduct: Product?
    
    let BASE_URL = "https://dummyjson.com/products"
    
    private var page = 0
    private let limit = 15
    private var skip: Int {
        return (page - 1) * limit
    }
    
    var urlString: String {
        return "\(BASE_URL)?limit=\(limit)&skip=\(skip)"
    }
    
    func handleRefresh() {
        products.removeAll()
        page = 0
        loadData()
    }
}

extension ProductListViewModel {
    @MainActor
    func fetchProductsAsync() async throws {
        do {
            page += 1
        
            guard let url = URL(string: urlString) else { throw WXError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw WXError.invalidResponse }
            
            guard let decodedResponse = try? JSONDecoder().decode(ProductResponse.self, from: data) else { throw WXError.invalidData }
            
            self.products.append(contentsOf: decodedResponse.products)
        } catch {
            isAlertPresented = true
        
            if let wxError = error as? WXError {
                switch wxError {
                case .invalidData:
                    activeAlert = .invalidData
                case .invalidResponse:
                    activeAlert = .invalidResponse
                case .invalidURL:
                    activeAlert = .invalidURL
                case .unableToComplete:
                    activeAlert = .unableToComplete
                }
            } else {
                activeAlert = .unableToComplete
            }
        }
        
    }
    
    func loadData() {
        Task { try await fetchProductsAsync() }
    }
}
