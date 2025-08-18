//
//  ProductListViewModel.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import Foundation

@MainActor
final class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var activeAlert: AlertState?
    @Published var isAlertPresented = false
    
    @Published var selectedProduct: Product?
    
    //    func getProducts() {
    //        isLoading = true
    //
    //        NetworkManager.shared.getProducts { result in
    //            DispatchQueue.main.async { [self] in
    //                isLoading = false
    //                switch result {
    //                case.success(let products):
    //                    self.products = products
    //                case.failure(let error):
    //                    isAlertPresented = true
    //                    switch error {
    //                    case .invalidData:
    //                        activeAlert = .invalidData
    //                    case .invalidResponse:
    //                        activeAlert = .invalidResponse
    //                    case .invalidURL:
    //                        activeAlert = .invalidURL
    //                    case .unableToComplete:
    //                        activeAlert = .unableToComplete
    //                    }
    //                }
    //            }
    //        }
    //    }
    
    func getProducts() async {
        isLoading = true
        
        do {
            products = try await NetworkManager.shared.getProducts()
            isLoading = false
        } catch {
            isAlertPresented = true
            isLoading = false
            
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
}
