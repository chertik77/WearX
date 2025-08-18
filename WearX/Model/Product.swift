//
//  Product.swift
//  Product
//
//  Created by Denys Babych on 18/08/2025.
//

import Foundation

struct Review: Decodable, Identifiable {
    let id = UUID()
    let rating: Double
    let comment: String
    let date: String
    let reviewerName: String
    
    enum CodingKeys: String, CodingKey {
        case rating, comment, date, reviewerName
    }
}

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double?
    let thumbnail: String
    let rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let warrantyInformation: String
    let shippingInformation: String
    let availabilityStatus: String
    let returnPolicy: String?
    let images: [String]
    let reviews: [Review]
    
    var discountedPrice: Double {
        guard let discountPercentage else { return price }
    
        return price * (1 - discountPercentage / 100)
    }
    
    var formattedPrice: String {
        return price.formatCurrency
    }
    
    var formattedDiscountedPrice: String {
        return discountedPrice.formatCurrency
    }
}


struct ProductResponse: Decodable {
    let products: [Product]
}

struct MockData {
    static let sampleProductOne = Product(
        id: 56,
        title: "Gucci Bloom Eau de",
        description: "Gucci Bloom by Gucci is a floral and captivating fragrance, with notes of tuberose, jasmine, and Rangoon creeper. It's a modern and romantic scent.",
        category: "beauty",
        price: 9.99,
        discountPercentage: 7.17,
        thumbnail: "",
        rating: 4.94,
        stock: 5,
        tags: ["fragrances", "perfumes"],
        brand: "Gucci",
        warrantyInformation: "6 months warranty",
        shippingInformation: "Ships overnight",
        availabilityStatus: "In Stock",
        returnPolicy: "No return policy",
        images: [
            "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/1.webp",
            "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/2.webp",
            "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/3.webp"
        ],
        reviews: [
            Review(
                rating: 4,
                comment: "Excelent quality!",
                date: "2025-04-30T09:41:02.053Z",
                reviewerName: "Aaliyah Hanson",
            ),
            Review(
                rating: 4,
                comment: "Excelent quality!",
                date: "2025-04-30T09:41:02.053Z",
                reviewerName: "Liam Smith",
            ),
            Review(
                rating: 4,
                comment: "Highly recommended!",
                date: "2025-04-30T09:41:02.053Z",
                reviewerName: "Avery Barnes",
            )
        ]
    )
    
    static let sampleProductTwo = Product(
        id: 57,
        title: "Gucci Bloom Eau de",
        description: "Gucci Bloom by Gucci is a floral and captivating fragrance, with notes of tuberose, jasmine, and Rangoon creeper. It's a modern and romantic scent.",
        category: "beauty",
        price: 9.99,
        discountPercentage: 7.17,
        thumbnail: "",
        rating: 4.94,
        stock: 5,
        tags: ["fragrances", "perfumes"],
        brand: "Gucci",
        warrantyInformation: "6 months warranty",
        shippingInformation: "Ships overnight",
        availabilityStatus: "In Stock",
        returnPolicy: "No return policy",
        images: [
            "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/1.webp",
            "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/2.webp",
            "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/3.webp"
        ],
        reviews: [
            Review(
                rating: 4,
                comment: "Excelent quality!",
                date: "2025-04-30T09:41:02.053Z",
                reviewerName: "Aaliyah Hanson",
            ),
            Review(
                rating: 4,
                comment: "Excelent quality!",
                date: "2025-04-30T09:41:02.053Z",
                reviewerName: "Liam Smith",
            ),
            Review(
                rating: 4,
                comment: "Highly recommended!",
                date: "2025-04-30T09:41:02.053Z",
                reviewerName: "Avery Barnes",
            )
        ]
    )
    
    
    static let products = [sampleProductOne, sampleProductTwo]
}
