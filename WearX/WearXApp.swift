//
//  WearXApp.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

@main
struct WearXApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            WearXTabView()
                .environmentObject(order)
        }
    }
}
