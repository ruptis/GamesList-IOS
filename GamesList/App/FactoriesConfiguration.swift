//
//  FactoriesConfiguration.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Factory
//import FirebaseAuth
//import FirebaseFirestore
//import FirebaseFirestoreSwift

extension Container {
//    var auth: Factory<Auth> {
//        self { Auth.auth() }.singleton
//    }
//
//    var firestore: Factory<Firestore> {
//        self { Firestore.firestore() }.singleton
//    }
//
//    var firestoreEncoder: Factory<Firestore.Encoder> {
//        self { Firestore.Encoder() }.singleton
//    }

    var authenticationService: Factory<AuthenticationService> {
        self { MockAuthenticationService() }.singleton
    }

    var userService: Factory<UserService> {
        self { MockUserService() }.singleton
    }

    var gameService: Factory<GameService> {
        self { MockGameService() }.singleton
    }

    var contentViewModel: Factory<ContentViewModel> {
        self { ContentViewModel() }.singleton
    }

    var welcomeViewModel: Factory<WelcomeViewModel> {
        self { WelcomeViewModel() }.singleton
    }

    var signInViewModel: Factory<SignInViewModel> {
        self { SignInViewModel() }
    }

    var signUpViewModel: Factory<SignUpViewModel> {
        self { SignUpViewModel() }
    }

    var profileViewModel: Factory<ProfileViewModel> {
        self { ProfileViewModel() }
    }
}
