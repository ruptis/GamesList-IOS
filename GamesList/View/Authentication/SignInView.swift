//
//  SignInView.swift
//  GamesList
//
//  Created by Admin on 12.03.2024.
//

import SwiftUI
import Factory

struct SignInView: View {
    @InjectedObject(\.welcomeViewModel) var welcomeViewModel
    @InjectedObject(\.signInViewModel) var viewModel

    var body: some View {
        VStack(alignment: .center) {
            Text("Sign In")
                    .font(.largeTitle)
                    .padding()

            VStack(alignment: .leading, spacing: 20) {
                AuthInputView(text: $viewModel.email, title: "Email", placeholder: "name@example.com")
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)

                AuthInputView(text: $viewModel.password, title: "Password", placeholder: "**********", isSecure: true)

                Button(action: {
                    Task {
                        try await viewModel.signIn()
                    }
                }) {
                    PrimaryButton(text: "Sign In")
                }
                        .padding(.top, 30)
                        .disabled(!viewModel.isValid)
                        .opacity(viewModel.isValid ? 1 : 0.5)
            }
                    .padding(.horizontal, 28)
                    .padding(.top, 60)

            Spacer()

            Button(action: {
                welcomeViewModel.toSignUp()
            }) {
                HStack(spacing: 3) {
                    Text("Don't have an account?")

                    Text("Sign Up")
                            .fontWeight(.semibold)
                }
            }
        }
                .navigationBarBackButtonHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
