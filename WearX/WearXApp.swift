//
//  WearXApp.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

@main
struct WearXApp: App {
    
    @State private var order = Order()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            WearXTabView()
                .environment(order)
                .environment(\.colorScheme, isDarkMode ? .dark : .light)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
