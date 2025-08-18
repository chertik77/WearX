//
//  ProductListViewModel.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import Foundation

final class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false

    @Published var selectedProduct: Product?
    
    func getProducts() {
        isLoading = true
    
        NetworkManager.shared.getProducts { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result {
                case.success(let products):
                    self.products = products
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
