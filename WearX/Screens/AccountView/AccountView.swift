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
        ZStack {
            NavigationView {
                Form {
                    Section {
                        TextField("First Name", text: $viewModel.user.firstName)
                        TextField("Last Name", text: $viewModel.user.lastName)
                        TextField("Email", text: $viewModel.user.email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                        DatePicker(
                            "Birthday",
                            selection: $viewModel.user.birthdate,
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
                            isOn: $viewModel.user.showOutOfStockItems
                        )
                        Toggle(
                            "Enable Dark Mode",
                            isOn: $viewModel.user.enableDarkMode
                        )
                    } header: {
                        Text("Requests")
                    }
                }
                .navigationTitle("Account")
                .tint(.orange)
            }
            .onAppear { viewModel.retrieveUser() }
            .alert(
                Text(
                    alertTitle(
                        for: viewModel.activeAlert ?? .unableToComplete
                    )
                ),
                isPresented: $viewModel.isAlertPresented,
                presenting: viewModel.activeAlert
            ) {
                alertActions(for: $0)
            } message: {
                alertMessage(for: $0)
            }
        }
    }
}

#Preview {
    AccountView()
}
