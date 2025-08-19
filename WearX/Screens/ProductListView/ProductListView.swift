//
//  ProductListView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct ProductListView: View {
    @State var viewModel = ProductListViewModel()
    
    @State private var selectedProduct: Product?
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.products) { product in
                    ProductListCell(product: product)
                        .listRowSeparator(.hidden)
                        .onTapGesture { selectedProduct = product }
                        .onAppear {
                            if product.id == viewModel.products.last?.id {
                                viewModel.loadData()
                            }
                        }
                }
                .refreshable { viewModel.handleRefresh() }
                .navigationTitle("Products")
                .listStyle(.plain)
            }
            .task { viewModel.loadData() }
            
            if viewModel.isInitialLoading {
                ProgressView()
                    .scaleEffect(2)
                    .tint(.accent)
            }
        }
        .sheet(item: $selectedProduct) { selectedProduct in
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
