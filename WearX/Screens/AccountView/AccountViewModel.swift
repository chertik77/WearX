//
//  AccountViewModel.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

@Observable final class AccountViewModel {

    @ObservationIgnored @AppStorage("user") private var userData: Data?
    @ObservationIgnored @AppStorage("isDarkMode") var isDarkMode = false
    
    var user = User()
    var isAlertPresented = false
    var activeAlert: AlertState?

    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            isAlertPresented = true
            activeAlert = .userSaveSuccess
        } catch {
            isAlertPresented = true
            activeAlert = .invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData else { return }
        
        do {
           user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            isAlertPresented = true
            activeAlert = .invalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            isAlertPresented = true
            activeAlert = .invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            isAlertPresented = true
            activeAlert = .invalidEmail
            return false
        }
    
        return true
    }
}
