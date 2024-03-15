//
//  WelcomeView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//
//

import SwiftUI

struct WelcomeView: View {
    @State private var path = [AuthState]()

    enum AuthState {
        case signIn
        case signUp
    }

    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .center) {
                Image(systemName: "gamecontroller")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)

                Text("Games List")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)

                VStack(spacing: 20) {
                    NavigationLink(value: AuthState.signIn) {
                        PrimaryButton(text: "Sign In")
                    }

                    NavigationLink(value: AuthState.signUp) {
                        PrimaryButton(text: "Sign Up")
                    }
                }
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                    .navigationDestination(for: AuthState.self) { state in
                        switch state {
                        case .signIn:
                            SignInView(path: $path)
                        case .signUp:
                            SignUpView(path: $path)
                        }
                    }

            }
                .padding()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
