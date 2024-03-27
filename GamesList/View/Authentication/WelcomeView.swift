//
//  WelcomeView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//
//

import SwiftUI
import Factory

struct WelcomeView: View {
    @InjectedObject(\.welcomeViewModel) private var viewModel

    var body: some View {
        NavigationStack(path: $viewModel.path) {
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
                    NavigationLink(value: WelcomeViewModel.AuthState.signIn) {
                        PrimaryButton(text: "Sign In")
                    }

                    NavigationLink(value: WelcomeViewModel.AuthState.signUp) {
                        PrimaryButton(text: "Sign Up")
                    }
                }
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                    .navigationDestination(for: WelcomeViewModel.AuthState.self) { state in
                        switch state {
                        case .signIn:
                            SignInView()
                        case .signUp:
                            SignUpView()
                        }
                    }

            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
