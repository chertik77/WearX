//
//  AccountViewModel.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var showOutOfStockItems = false
    @Published var enableDarkMode = false
    
    @Published var isAlertPresented = false
    @Published var activeAlert: AlertState?

    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            isAlertPresented = true
            activeAlert = .invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            isAlertPresented = true
            activeAlert = .invalidEmail
            return false
        }
    
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        print("Changes have been saved successfully!")
    }
}
