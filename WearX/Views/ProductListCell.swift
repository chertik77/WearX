//
//  ProductListCell.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI
import Kingfisher

struct ProductListCell: View {
    
    let product: Product
    
    var body: some View {
        HStack(spacing: 16) {
            KFImage(URL(string: product.thumbnail))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(.rect(cornerRadius: 8))
                .frame(width: 100, height: 75)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(product.title)
                    .font(.headline)
                    .fontWeight(.medium)
                    .lineLimit(2)
                    .minimumScaleFactor(0.75)
                
                Text(product.formattedPrice)
                    .font(.subheadline)
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
