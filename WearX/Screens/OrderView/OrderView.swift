//
//  OrderView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.products
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems) { product in
                            ProductListCell(product: product)
                        }
                        .onDelete(perform: deleteItem)
                    }
                    .listStyle(.plain)
                    
                    WXButton(label: "ewd") {
                        print("placed")
                    }
                    .padding(30)
                }
                
                if orderItems.isEmpty {
                    EmptyState(
                        image: "empty-order",
                        message: "Your have no items in your product. Please add a product!"
                    )
                }
            }
            .navigationTitle("Orders")
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
