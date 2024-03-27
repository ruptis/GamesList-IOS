//
//  MockAuthenticationService.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation

class MockAuthenticationService: AuthenticationService {
    @Published var userId: String? = "userId"
    var userIdPublisher: Published<String?>.Publisher { $userId }
    
    func signIn(email: String, password: String) async throws -> String {
        userId = "userId"
        return userId!
    }
    
    func signUp(email: String, password: String) async throws -> String {
        userId = "userId"
        return userId!
    }
    
    func signOut() async throws {
        userId = nil
    }
    
    func deleteUser() async throws {
    }
    
}
