//
//  StarRatingView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct StarRatingView: View {
    
    var rating: Double
    let maxRating: Int
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Text(Image(systemName: "star"))
                    .foregroundStyle(.yellow)
                    .aspectRatio(contentMode: .fill)
            }
        }.overlay(
            GeometryReader { reader in
                HStack(spacing: 0) {
                    ForEach(0..<maxRating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .clipShape(
                    ClipShape(
                        width: (reader.size.width / CGFloat(maxRating)) * CGFloat(rating)
                    )
                )
            }
        )
    }
}

struct ClipShape: Shape {
    let width: Double
    
    func path(in rect: CGRect) -> Path {
        Path(
            CGRect(
                x: rect.minX,
                y: rect.minY,
                width: width,
                height: rect.height
            )
        )
    }
}

#Preview {
    StarRatingView(rating: 3.5, maxRating: 5)
}
