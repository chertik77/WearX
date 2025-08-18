//
//  ProductListViewModel.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import Foundation

final class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    func getProducts() {
        NetworkManager.shared.getProducts { result in
            DispatchQueue.main.async {
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
