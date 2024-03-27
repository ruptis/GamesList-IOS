//
//  SignUpViewModel.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation
import Factory

class SignUpViewModel: ObservableObject {
    @Injected(\.authenticationService) private var authenticationService
    @Injected(\.userService) private var userService

    @Published var email = ""
    @Published var name = ""
    @Published var password = ""
    @Published var confirmPassword = ""

    var isValid: Bool {
        !email.isEmpty && !name.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
                && email.contains("@") && password.count >= 6 && password.count <= 20 && password == confirmPassword
    }

    @MainActor
    func signUp() async {
        do {
            let userId = try await authenticationService.signUp(email: email, password: password)
            let user = try await userService.createUser(id: userId, name: name, email: email)
            print("User created: \(user)")
        } catch {
            print("Failed to sign up user with error: \(error.localizedDescription)")
        }
    }
}
