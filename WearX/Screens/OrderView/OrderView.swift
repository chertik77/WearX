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
