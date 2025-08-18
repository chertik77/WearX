//
//  AccountView.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

struct AccountView: View {
    
    @Bindable var viewModel = AccountViewModel()

    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                Form {
                    Section {
                        TextField("First Name", text: $viewModel.user.firstName)
                            .focused($focusedTextField, equals: .firstName)
                            .onSubmit { focusedTextField = .lastName }
                            .submitLabel(.next)
                        
                        TextField("Last Name", text: $viewModel.user.lastName)
                            .focused($focusedTextField, equals: .lastName)
                            .onSubmit { focusedTextField = .email }
                            .submitLabel(.next)
                        
                        TextField("Email", text: $viewModel.user.email)
                            .focused($focusedTextField, equals: .email)
                            .onSubmit { focusedTextField = nil }
                            .submitLabel(.continue)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                        
                        DatePicker(
                            "Birthday",
                            selection: $viewModel.user.birthdate,
                            in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
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
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss") { focusedTextField = nil }
                    }
                }
                .tint(.accent)
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
