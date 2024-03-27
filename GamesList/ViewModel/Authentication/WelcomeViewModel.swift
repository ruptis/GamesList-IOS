//
//  WelcomeViewModel.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation

class WelcomeViewModel: ObservableObject {
    enum AuthState {
        case signIn
        case signUp
    }

    @Published var path = [AuthState]()

    func toSignIn() {
        path = [.signIn]
    }

    func toSignUp() {
        path = [.signUp]
    }
}
