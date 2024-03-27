//
//  MockUserService.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation

extension User {
    static var MOCK: User {
        User(id: "1",
                name: "Name",
                email: "example@gmail.com",
                country: "country",
                gender: Gender.Male,
                dateOfBirth: Date(),
                dateOfRegistration: Date(),
                bio: "bio",
                links: "link1, link2",
                gamesCount: 10,
                passedGamesCount: 5)
    }
}

class MockUserService: UserService {
    private var user: User = User.MOCK
    
    func createUser(id: String, name: String, email: String) async throws -> User {
        user
    }
    
    func getUser(byId id: String) async throws -> User {
        user
    }
    
    func updateUser(updatedUser: User) async throws -> User {
        user = updatedUser
        return user
    }
}
