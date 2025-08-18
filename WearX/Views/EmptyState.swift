//
//  EmptyState.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct EmptyState: View {
    
    let systemNameImage: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
    
            VStack {
                Image(systemName: systemNameImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 75)
                    .foregroundStyle(.secondary)
                
                Text(message)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyState(
        systemNameImage: "basket",
        message: "This is our text message, for testing."
    )
}
