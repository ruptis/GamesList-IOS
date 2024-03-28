//
// Created by Admin on 28.03.2024.
//

import Foundation
import os.log
import Factory
import FirebaseFirestore
import FirebaseFirestoreSwift
import Algorithms

class CollectionServiceImpl: CollectionService {
    @Injected(\.firestore) private var firestore
    @Injected(\.firestoreEncoder) private var firestoreEncoder

    private let logger = Logger(subsystem: "com.gameslist", category: "collection")

    func getCollectionItems(userId: String) async throws -> [CollectionItem] {
        let querySnapshot = try await getGamesCollection(for: userId).getDocuments()
        guard let statuses = try? querySnapshot.documents.compactMap( { try $0.data(as: CollectionItem.self) } ) else {
            logger.error("Failed to decode statuses")
            throw DecodingError()
        }
        logger.info("Fetched statuses for \(statuses.count) games")
        return statuses
    }

    func getCollectionItem(for gameId: String, userId: String) async throws -> CollectionItem? {
        guard let document = try? await getGamesCollection(for: userId).document(gameId).getDocument() else {
            logger.error("Failed to fetch status for game with id: \(gameId)")
            throw FetchingError(entity: "Game in collection")
        }
        if !document.exists {
            logger.info("Game with id: \(gameId) not found")
            return nil
        }

        guard let data = try? document.data(as: CollectionItem.self) else {
            logger.error("Failed to decode status")
            throw DecodingError()
        }
        logger.info("Fetched status for game with id: \(gameId)")
        return data
    }

    func getCollectionItems(for gameIds: [String], userId: String) async throws -> [CollectionItem] {
        var result = [CollectionItem]()

        // use .chunks method from Algorithms library to split gameIds into chunks of 10
        for chunk in gameIds.chunks(ofCount: 10) {
            let chunkedIds = chunk.map { $0 }
            let querySnapshot = try await getGamesCollection(for: userId).whereField(FieldPath.documentID(), in: chunkedIds).getDocuments()
            guard let items = try? querySnapshot.documents.compactMap( { try $0.data(as: CollectionItem.self) } ) else {
                logger.error("Failed to decode statuses")
                throw DecodingError()
            }
            result.append(contentsOf: items)
        }

        logger.info("Fetched statuses for \(result.count) games")
        return result
    }

    func getCollectionItems(for status: Game.Status, userId: String) async throws -> [CollectionItem] {
        let querySnapshot = try await getGamesCollection(for: userId).whereField("status", isEqualTo: status.rawValue).getDocuments()
        guard let statuses = try? querySnapshot.documents.compactMap( { try $0.data(as: CollectionItem.self) } ) else {
            logger.error("Failed to decode statuses")
            throw DecodingError()
        }
        logger.info("Fetched statuses for \(statuses.count) games")
        return statuses
    }

    func toggleStatus(for gameId: String, to status: Game.Status, userId: String) async throws -> Game.Status? {
        let item = try await getCollectionItem(for: gameId, userId: userId)

        let currentStatus = item?.status
        guard let newStatus = currentStatus == nil ? status : currentStatus == status ? nil : status else {
            try await getGamesCollection(for: userId).document(gameId).delete()
            logger.info("Status for game with id: \(gameId) reset")
            return nil
        }
        guard let data = try? firestoreEncoder.encode(CollectionItem(status: newStatus)) else {
            logger.error("Failed to encode status")
            throw EncodingError()
        }
        try await getGamesCollection(for: userId).document(gameId).setData(data)
        logger.info("Status for game with id: \(gameId) toggled")
        return newStatus
    }

    private func getGamesCollection(for userId: String) -> CollectionReference {
        firestore.collection("users").document(userId).collection("games-collection")
    }
}
