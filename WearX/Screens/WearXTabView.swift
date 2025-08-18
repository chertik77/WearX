//
//  WearXTabView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct WearXTabView: View {
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
        }
        .tint(.orange)
    }
}

#Preview {
    WearXTabView()
}
