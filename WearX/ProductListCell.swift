//
//  ProductListCell.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct ProductListCell: View {
    
    let product: Product

    var body: some View {
        HStack {
            Image("product-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .clipShape(.rect(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.title)
                    .font(.title3)
                    .fontWeight(.medium)
                
                Text("$\(product.price, specifier: "%.1f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    ProductListCell(product: MockData.sampleProduct)
}
