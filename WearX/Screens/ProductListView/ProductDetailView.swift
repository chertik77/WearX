//
//  ProductDetailView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.75)
                    
                    HStack {
                        Text(product.formattedDiscountedPrice)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.green)
                        
                        Text(product.formattedPrice)
                            .font(.title3)
                            .strikethrough()
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text(String(format: "%.1f", product.rating))
                                .font(.headline)
                        }
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(product.description)
                        .font(.body)
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                
                Divider()
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Key Details")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        if let brand = product.brand {
                            detailRow(label: "Brand:", value: brand)
                        }
                        detailRow(
                            label: "Category:",
                            value: product.category.capitalized
                        )
                        detailRow(
                            label: "Stock:",
                            value: "\(product.stock) units"
                        )
                        detailRow(
                            label: "Availability:",
                            value: product.availabilityStatus
                        )
                        detailRow(
                            label: "Warranty:",
                            value: product.warrantyInformation
                        )
                        detailRow(
                            label: "Shipping:",
                            value: product.shippingInformation
                        )
                        if let returnPolicy = product.returnPolicy {
                            detailRow(
                                label: "Return Policy:",
                                value: returnPolicy
                            )
                        }
                    }
                }
                .padding(.horizontal)
                
                if !product.reviews.isEmpty {
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 15) {
                        ReviewsView(reviews: product.reviews)
                    }
                    .padding(.horizontal)
                }
                
                WXButton(label: "Add to Order", icon: "cart.fill") {
                    print("order")
                }
                
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
    }
}

private func detailRow(label: String, value: String) -> some View {
    HStack {
        Text(label)
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundStyle(.secondary)
        Text(value)
            .font(.subheadline)
            .foregroundStyle(.primary)
    }
}

#Preview {
    ProductDetailView(product: MockData.sampleProductOne)
}
