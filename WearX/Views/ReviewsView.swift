//
//  ReviewsView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct ReviewsView: View {
    
    let reviews: [Review]
    
    var body: some View {
        Text("Reviews (\(reviews.count))")
            .font(.title2)
            .fontWeight(.bold)
        
        ForEach(reviews) { review in
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    StarRatingView(rating: review.rating, maxRating: 5)
                    Spacer()
                    Text(formatReviewDate(review.date))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Text(review.comment)
                    .font(.body)
                Text("- \(review.reviewerName)")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            .padding(.vertical, 5)
        }
    }
    
    private func formatReviewDate(_ dateString: String) -> String {
        let inputFormatter = ISO8601DateFormatter()
    
        inputFormatter.formatOptions = [
            .withInternetDateTime,
            .withFractionalSeconds
        ] 
        
        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateStyle = .medium
            outputFormatter.timeStyle = .none
            return outputFormatter.string(from: date)
        }

        return dateString
    }
}

#Preview {
    ReviewsView(reviews: MockData.sampleProduct.reviews)
}
