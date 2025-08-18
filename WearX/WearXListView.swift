//
//  WearXListView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct WearXListView: View {
    var body: some View {
        NavigationView {
            List(MockData.products) { product in
                Text(product.title)
            }
            .navigationTitle("Appetizers")
        }
    }
}

#Preview {
    WearXListView()
}
