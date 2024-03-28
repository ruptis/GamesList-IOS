//
//  AuthenticationServiceImpl.swift
//  GamesList
//
//  Created by Admin on 28.03.2024.
//

import Foundation
import os.log
import Factory
import FirebaseAuth

class AuthenticationServiceImpl: AuthenticationService {
    @Injected(\.auth) private var auth
    private let logger = Logger(subsystem: "com.gameslist", category: "authentication")

    init() {
        logger.info("Authentication service initialized")
        userId = auth.currentUser?.uid
    }

    @Published var userId: String?
    var userIdPublisher: Published<String?>.Publisher { $userId }

    func signIn(email: String, password: String) async throws -> String {
        logger.info("User with email: \(email) tried to sign in")
        do {
            try await auth.signIn(withEmail: email, password: password)
            userId = auth.currentUser?.uid
            logger.info("User with email: \(email) signed in")
            return userId!
        } catch {
            logger.error("Failed to sign in user with error: \(error.localizedDescription)")
            throw error
        }
    }

    func signUp(email: String, password: String) async throws -> String {
        logger.info("User with email: \(email) tried to sign up")
        do {
            try await auth.createUser(withEmail: email, password: password)
            userId = auth.currentUser?.uid
            logger.info("User with email: \(email) signed up")
            return userId!
        } catch {
            logger.error("Failed to sign up user with error: \(error.localizedDescription)")
            throw error
        }
    }

    func signOut() async throws {
        logger.info("User with id: \(self.userId ?? "nil") tried to sign out")
        do {
            try auth.signOut()
            userId = nil
            logger.info("User with id: \(self.userId ?? "nil") signed out")
        } catch {
            logger.error("Failed to sign out user with error: \(error.localizedDescription)")
            throw error
        }
    }

    func deleteUser() async throws {
        logger.info("User with id: \(self.userId ?? "nil") tried to delete account")
        do {
            try await auth.currentUser?.delete()
            logger.info("User with id: \(self.userId ?? "nil") deleted account")
        } catch {
            logger.error("Failed to delete account with error: \(error.localizedDescription)")
            throw error
        }
    }
}
