//
//  WearXTabView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct WearXTabView: View {
    
    @Environment(Order.self) var order: Order

    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                ProductListView()
            }
            Tab("Account", systemImage: "person") {
                AccountView()
            }
            Tab("Order", systemImage: "bag") {
                OrderView()
            }
            .badge(order.items.count)
        }
        .tint(.accent)
    }
}

#Preview {
    WearXTabView()
}
