//
//  SignInView.swift
//  GamesList
//
//  Created by Admin on 12.03.2024.
//

import SwiftUI

struct SignInView: View {
    @Binding var path: [WelcomeView.AuthState]

    @State var email = ""
    @State var password = ""

    var body: some View {
        VStack(alignment: .center) {
            Text("Sign In")
                .font(.largeTitle)
                .padding()

            VStack(alignment: .leading, spacing: 20) {
                InputView(text: $email, title: "Email", placeholder: "name@example.com")
                    .autocapitalization(.none)

                InputView(text: $password, title: "Password", placeholder: "**********")

                Button(action: {

                }) {
                    PrimaryButton(text: "Sign In")
                }
                    .padding(.horizontal, 20)
            }
                .padding(.horizontal, 28)
                .padding(.top, 60)

            Spacer()

            Button(action: {
                path = [.signUp]
            }) {
                HStack(spacing: 3) {
                    Text("Don't have an account?")

                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                    .accentColor(Color(.systemIndigo))
            }
        }
            .navigationBarBackButtonHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(path: .constant([.signIn]))
    }
}
