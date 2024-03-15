//
//  SignUpView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//
//

import SwiftUI

struct SignUpView: View {
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

                InputView(text: $email, title: "Name", placeholder: "name")

                InputView(text: $password, title: "Password", placeholder: "**********")

                InputView(text: $password, title: "Confirm password", placeholder: "**********")

                Button(action: {

                }) {
                    PrimaryButton(text: "Sign Up")
                }
                    .padding(.top, 30)
            }
                .padding([.top, .leading, .trailing], 32)

            Spacer()

            Button(action: {
                path = [.signIn]
            }) {
                HStack(spacing: 3) {
                    Text("Already have an account?")

                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                    .accentColor(Color(.systemIndigo))
            }
        }
            .navigationBarBackButtonHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(path: .constant([.signUp]))
    }
}
