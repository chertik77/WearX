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
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let thumbnail: String
}


struct ProductResponse {
    let products: [Product]
}

struct MockData {
    static let sampleProduct = Product(
        id: 56,
        title: "Essence Mascara Lash Princess",
        description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
        price: 9.99,
        discountPercentage: 7.17,
        rating: 4.5,
        stock: 5,
        brand: "Essense",
        thumbnail: ""
    )
    
    static let products = [sampleProduct, sampleProduct, sampleProduct, sampleProduct]
}
