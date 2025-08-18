//
//  Product.swift
//  Product
//
//  Created by Denys Babych on 18/08/2025.
//

import Foundation

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let thumbnail: String
}


struct ProductResponse: Decodable {
    let products: [Product]
}

struct MockData {
    static let sampleProduct = Product(
        id: 56,
        title: "Essence Mascara Lash Princess",
        price: 9.99,
        thumbnail: ""
    )
    
    static let products = [sampleProduct, sampleProduct, sampleProduct, sampleProduct]
}
