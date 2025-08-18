//
//  Order.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Product] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.discountedPrice }
    }

    func add(_ product: Product) {
        items.append(product)
    }
    
    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
