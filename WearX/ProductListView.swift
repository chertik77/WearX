//
//  ProductListView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct ProductListView: View {
    var body: some View {
        NavigationView {
            List(MockData.products) { product in
              ProductListCell(product: product)
            }
            .navigationTitle("Appetizers")
        }
    }
}

#Preview {
    ProductListView()
}
