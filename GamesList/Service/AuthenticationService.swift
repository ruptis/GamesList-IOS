//
//  AuthenticationService.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation

protocol AuthenticationService {
    var userId: String? { get }
    var userIdPublisher: Published<String?>.Publisher { get }

    func signIn(email: String, password: String) async throws -> String
    func signUp(email: String, password: String) async throws -> String
    func signOut() async throws
    func deleteUser() async throws
}
