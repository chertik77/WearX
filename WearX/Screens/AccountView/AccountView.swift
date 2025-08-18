//
//  AccountView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct AccountView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthdate = Date()
    @State private var showOutOfStockItems = false
    @State private var enableDarkMode = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    DatePicker(
                        "Birthday",
                        selection: $birthdate,
                        displayedComponents: .date
                    )
                    Button {
                        print("save")
                    } label: {
                        Text("Save changes")
                    }
                } header: {
                    Text("Personal Info")
                }
                
                Section {
                    Toggle(
                        "Show Out of Stock Products",
                        isOn: $showOutOfStockItems
                    )
                    Toggle(
                        "Enable Dark Mode",
                        isOn: $enableDarkMode
                    )
                } header: {
                    Text("Requests")
                }
            }
            .navigationTitle("Account")
            .tint(.orange)
        }
    }
}

#Preview {
    AccountView()
}
