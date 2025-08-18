//
//  ProductListView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel = ProductListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.products) { product in
                    ProductListCell(product: product)
                        .onTapGesture {
                            viewModel.selectedProduct = product
                        }
                }
                .navigationTitle("Products")
                .listStyle(.plain)
            }
            .task { viewModel.getProducts() }
            
            if viewModel.isLoading {
                ProgressView()
                    .tint(.accent)
            }
        }
        .sheet(item: $viewModel.selectedProduct) { selectedProduct in
            ProductDetailView(product: selectedProduct)
        }
        .alert(
            Text(
                alertTitle(
                    for: viewModel.activeAlert ?? .unableToComplete
                )
            ),
            isPresented: $viewModel.isAlertPresented,
            presenting: viewModel.activeAlert
        ) {
            alertActions(for: $0)
        } message: {
            alertMessage(for: $0)
        }
    }
}

#Preview {
    ProductListView()
}
