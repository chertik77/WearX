//
//  Alert.swift
//  WearX
//
//  Created by Denys Babych on 18/08/2025.
//

import SwiftUI

enum AlertState {
    case invalidData, invalidResponse, invalidURL, unableToComplete
    case invalidForm, invalidEmail, userSaveSuccess, invalidUserData
}

func alertTitle(for alert: AlertState) -> String {
    switch alert {
    case .invalidData:
        "Server Error"
    case .invalidResponse:
        "Server Error"
    case .invalidURL:
        "Server Error"
    case .unableToComplete:
        "Server Error"
    case.invalidForm:
        "Invalid Form"
    case .invalidEmail:
        "Invalid Email"
    case .userSaveSuccess:
        "Profile Saved"
    case .invalidUserData:
        "Profile Error"
    }
}

@ViewBuilder
func alertMessage(for alert: AlertState) -> some View {
    switch alert {
    case .invalidData:
        Text("The data recieved from the server was invalid. Please contact support.")
    case .invalidResponse:
        Text("Invalid response from the server. Please try again later or contact support.")
    case .invalidURL:
        Text("There was an issue connecting to the server. If this persists, please contact support.")
    case .unableToComplete:
        Text("Unable to complete your request at this time. Please check your internet connection or try again later.")
    case .invalidForm:
        Text("Please ensure all fields in the form have been filled out.")
    case .invalidEmail:
        Text("Please ensure your email is correct")
    case .userSaveSuccess:
        Text("Your profile information was successfully saved.")
    case .invalidUserData:
        Text("There was an error saving or retrieving your profile.")
    }
}

@ViewBuilder
func alertActions(for alert: AlertState) -> some View {
    switch alert {
    case .invalidData:
        Button("OK") {}
    case .invalidResponse:
        Button("OK") {}
    case .invalidURL:
        Button("OK") {}
    case .unableToComplete:
        Button("OK") {}
    case .invalidForm:
        Button("OK") {}
    case .invalidEmail:
        Button("OK") {}
    case .userSaveSuccess:
        Button("OK") {}
    case .invalidUserData:
        Button("OK") {}
    }
}
