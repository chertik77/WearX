//
//  AccountViewModel.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

final class AccountViewModel: ObservableObject {

    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    
    @Published var isAlertPresented = false
    @Published var activeAlert: AlertState?

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
        guard let userData = userData else { return }
        
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
