//
//  UserService.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

protocol UserService {
    func createUser(id: String, name: String, email: String) async throws -> User
    func getUser(byId id: String) async throws -> User
    func updateUser(updatedUser: User) async throws -> User
}
