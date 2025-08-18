//
//  AccountView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct AccountView: View {
    
   @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    DatePicker(
                        "Birthday",
                        selection: $viewModel.birthdate,
                        displayedComponents: .date
                    )
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save changes")
                    }
                } header: {
                    Text("Personal Info")
                }
                Section {
                    Toggle(
                        "Show Out of Stock Products",
                        isOn: $viewModel.showOutOfStockItems
                    )
                    Toggle(
                        "Enable Dark Mode",
                        isOn: $viewModel.enableDarkMode
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
