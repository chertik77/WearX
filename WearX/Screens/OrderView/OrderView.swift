//
//  OrderView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { product in
                            ProductListCell(product: product)
                        }
                        .onDelete(perform: order.delete)
                    }
                    .listStyle(.plain)
                    
                    WXButton(
                        label: "\(order.totalPrice.formatCurrency) - Place Order"
                    ) {
                        print("placed")
                    }
                    .padding(30)
                }
                
                if order.items.isEmpty {
                    EmptyState(
                        image: "empty-order",
                        message: "Your have no items in your product. Please add a product!"
                    )
                }
            }
            .navigationTitle("Orders")
        }
    }
}

#Preview {
    OrderView()
}
