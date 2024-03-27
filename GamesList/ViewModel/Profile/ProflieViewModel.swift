//
//  ProflieViewModel.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation
import Factory

class ProfileViewModel: ObservableObject {
    @Injected(\.authenticationService) private var authenticationService
    @Injected(\.userService) private var userService

    @Published private(set) var user: User?

    @Published var isEditing: Bool = false

    var name: String {
        user?.name ?? ""
    }

    var email: String {
        user?.email ?? ""
    }

    var country: String {
        user?.country ?? ""
    }

    var gender: String {
        user?.gender?.rawValue ?? ""
    }

    var dateOfBirth: String {
        user?.dateOfBirth?.formatted(.dateTime.day().month().year()) ?? ""
    }

    var dateOfRegistration: String {
        user?.dateOfRegistration.formatted(.dateTime.day().month().year()) ?? ""
    }

    var gamesCount: String {
        "\(user?.gamesCount ?? 0)"
    }

    var passedGamesCount: String {
        "\(user?.passedGamesCount ?? 0)"
    }
    
    var links: String {
        user?.links ?? ""
    }

    var bio: String {
        user?.bio ?? ""
    }

    func editProfile() {
        isEditing.toggle()
    }

    @MainActor
    func fetchUser() async {
        guard let userId = authenticationService.userId else {
            return
        }

        do {
            user = try await userService.getUser(byId: userId)
        } catch {
            print(error)
        }
    }

    @MainActor
    func signOut() async {
        do {
            try await authenticationService.signOut()
        } catch {
            print(error)
        }
    }
}
