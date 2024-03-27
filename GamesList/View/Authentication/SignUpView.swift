//
//  SignUpView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//
//

import SwiftUI
import Factory

struct SignUpView: View {
    @InjectedObject(\.welcomeViewModel) private var welcomeViewModel
    @InjectedObject(\.signUpViewModel) private var viewModel

    var body: some View {
        VStack(alignment: .center) {
            Text("Sign In")
                    .font(.largeTitle)
                    .padding()

            VStack(alignment: .leading, spacing: 20) {
                AuthInputView(text: $viewModel.email, title: "Email", placeholder: "name@example.com")
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)

                AuthInputView(text: $viewModel.name, title: "Name", placeholder: "name")

                AuthInputView(text: $viewModel.password, title: "Password", placeholder: "**********", isSecure: true)
                        .autocapitalization(.none)

                AuthInputView(text: $viewModel.confirmPassword, title: "Confirm password", placeholder: "**********", isSecure: true)
                        .autocapitalization(.none)

                Button(action: {
                    Task {
                        await viewModel.signUp()
                    }
                }) {
                    PrimaryButton(text: "Sign Up")
                }
                        .padding(.top, 30)
                        .disabled(!viewModel.isValid)
                        .opacity(viewModel.isValid ? 1 : 0.5)
            }
                    .padding([.top, .leading, .trailing], 32)

            Spacer()

            Button(action: {
                welcomeViewModel.toSignIn()
            }) {
                HStack(spacing: 3) {
                    Text("Already have an account?")

                    Text("Sign In")
                            .fontWeight(.semibold)
                }
            }
        }
                .navigationBarBackButtonHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
