//
//  ImageCarouselView.swift
//  WearX
//
//  Created by Denys Babych on 19/08/2025.
//

import SwiftUI
import Kingfisher

struct ImageCarouselView: View {
    let images: [String]
    
    @State private var selectedImageIndex: Int = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<images.count, id: \.self) { index in                        KFImage(URL(string: images[index]))
                        .resizable()
                        .tag(index)
                        .aspectRatio(contentMode: .fit)
                }
            }
            .frame(height: 250)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            HStack {
                ForEach(0..<images.count, id: \.self) { index in
                    Capsule()
                        .fill(.white.opacity(selectedImageIndex == index ? 1 : 0.33))
                        .frame(width: 35, height: 8)
                        .onTapGesture { selectedImageIndex = index }
                }
                .offset(y: 135)
            }
        }
    }
}

#Preview {
    ImageCarouselView(images: MockData.sampleProductOne.images)
}
