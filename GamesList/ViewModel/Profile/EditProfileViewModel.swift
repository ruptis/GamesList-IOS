//
//  EditProfileViewModel.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation
import Factory

class EditProfileViewModel: ObservableObject {
    @Injected(\.userService) private var userService

    private var user: User

    init(user: User) {
        self.user = user
        name = user.name
        email = user.email
        country = user.country ?? ""
        gender = user.gender
        dateOfBirth = user.dateOfBirth ?? Date()
        links = user.links ?? ""
        bio = user.bio ?? ""
    }

    @Published var name: String {
        didSet {
            user.name = name
        }
    }

    @Published var email: String {
        didSet {
            user.email = email
        }
    }

    @Published var country: String {
        didSet {
            user.country = country
        }
    }

    @Published var gender: User.Gender? {
        didSet {
            user.gender = gender
        }
    }

    @Published var dateOfBirth: Date {
        didSet {
            user.dateOfBirth = dateOfBirth
        }
    }
    
    @Published var links: String {
        didSet {
            user.links = links
        }
    }

    @Published var bio: String {
        didSet {
            user.bio = bio
        }
    }

    @MainActor
    func save() async throws {
        _ = try await userService.updateUser(updatedUser: user)
    }
}
