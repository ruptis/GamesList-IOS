//
//  SignInViewModel.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation
import Factory

class SignInViewModel: ObservableObject {
    @Injected(\.authenticationService) private var authenticationService

    @Published var email = ""
    @Published var password = ""

    var isValid: Bool {
        !email.isEmpty && !password.isEmpty && email.contains("@") && password.count >= 6 && password.count <= 20
    }

    @MainActor
    func signIn() async throws {
        _ = try await authenticationService.signIn(email: email, password: password)
    }
}
