//
//  UserServiceImpl.swift
//  GamesList
//
//  Created by Admin on 28.03.2024.
//

import Foundation
import os.log
import Factory
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserServiceImpl: UserService {
    @Injected(\.firestore) private var firestore
    @Injected(\.firestoreEncoder) private var firestoreEncoder
    @Injected(\.collectionService) private var collectionService

    private let logger = Logger(subsystem: "com.gameslist", category: "user")

    func createUser(id: String, name: String, email: String) async throws -> User {
        let user = User(id: id, name: name, email: email, dateOfRegistration: Date())
        guard let data = try? firestoreEncoder.encode(user) else {
            logger.error("Failed to encode user")
            throw InvalidDataError()
        }
        do {
            try await firestore.collection("users").document(id).setData(data)
            logger.info("User with id: \(id) created")
            return user
        } catch {
            logger.error("Failed to create user with error: \(error.localizedDescription)")
            throw error
        }
    }

    func getUser(byId id: String) async throws -> User {
        do {
            let document = try await firestore.collection("users").document(id).getDocument()
            guard var user = try? document.data(as: User.self) else {
                logger.error("Failed to decode user")
                throw DecodingError()
            }
            try await addGamesCount(to: &user)
            logger.info("User with id: \(id) fetched")
            return user
        } catch {
            logger.error("Failed to fetch user with error: \(error.localizedDescription)")
            throw error
        }
    }

    func updateUser(updatedUser: User) async throws -> User {
        guard let data = try? firestoreEncoder.encode(updatedUser) else {
            logger.error("Failed to encode user")
            throw EncodingError()
        }
        do {
            try await firestore.collection("users").document(updatedUser.id!).setData(data)
            logger.info("User with id: \(updatedUser.id!) updated")
            return updatedUser
        } catch {
            logger.error("Failed to update user with error: \(error.localizedDescription)")
            throw error
        }
    }

    private func addGamesCount(to user: inout User) async throws {
        let items = try await collectionService.getCollectionItems(userId: user.id!)
        user.gamesCount = items.count
        user.passedGamesCount = items.filter { $0.status == .Passed }.count
    }
}
