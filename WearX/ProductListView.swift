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
        NavigationView {
            List(viewModel.products) { product in
                ProductListCell(product: product)
            }
            .navigationTitle("Appetizers")
        }
        .task { viewModel.getProducts() }
    }
}

#Preview {
    ProductListView()
}
