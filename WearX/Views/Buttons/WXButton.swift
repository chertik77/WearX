//
//  WXButton.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct WXButton: View {
    
    let icon: String?
    let label: LocalizedStringKey
    let action: () -> Void
    
    init(
        label: LocalizedStringKey,
        icon: String? = nil,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.icon = icon
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 8) {
                if let icon { Image(systemName: icon) }
                Text(label)
            }
            .font(.headline)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(.accent)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 10))
        }
    }
}


#Preview {
    WXButton(label: "Submit", icon: "person") {
        print("Button action")
    }
}
