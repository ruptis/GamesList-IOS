//
// Created by Admin on 28.03.2024.
//

import Foundation
import os.log
import Factory
import FirebaseFirestore
import FirebaseFirestoreSwift

class GameServiceImpl: GameService {
    @Injected(\.firestore) private var firestore
    @Injected(\.firestoreEncoder) private var firestoreEncoder
    @Injected(\.collectionService) private var collectionService

    private let logger = Logger(subsystem: "com.gameslist", category: "game")

    private var platformsListener: ListenerRegistration?

    private var platforms = [String: Platform]()

    init() {
        subscribeToPlatforms()
        logger.info("Game service initialized")
    }

    deinit {
        unsubscribeFromPlatforms()
    }

    func getGames(userId: String) async throws -> [Game] {
        let querySnapshot = try await firestore.collection("games").getDocuments()
        guard var games = try? querySnapshot.documents.compactMap( { try $0.data(as: Game.self) } ) else {
            logger.error("Failed to decode games")
            throw DecodingError()
        }
        try await addStatus(for: &games, userId: userId)
        addPlatformData(to: &games)
        logger.info("Fetched \(games.count) games")
        return games
    }

    func getGames(by status: Game.Status, userId: String) async throws -> [Game] {
        let items = try await collectionService.getCollectionItems(for: status, userId: userId)
        let gamesIds = items.map { $0.gameId! }

        if gamesIds.isEmpty {
            logger.info("No games with status: \(status.rawValue)")
            return []
        }

        var games = try await firestore.collection("games").whereField(FieldPath.documentID(), in: gamesIds).getDocuments()
            .documents.compactMap { try? $0.data(as: Game.self) }

        addStatus(for: &games, status: status)
        addPlatformData(to: &games)
        logger.info("Fetched \(games.count) games with status: \(status.rawValue)")
        return games
    }

    func getGame(by id: String, userId: String) async throws -> Game {
        let document = try await firestore.collection("games").document(id).getDocument()
        guard var game = try? document.data(as: Game.self) else {
            logger.error("Failed to decode game")
            throw DecodingError()
        }
        try await addStatus(for: &game, userId: userId)
        addPlatformData(to: &game)
        logger.info("Game with id: \(id) fetched")
        return game
    }

    private func subscribeToPlatforms() {
        platformsListener = firestore.collection("platforms").addSnapshotListener { querySnapshot, error in
            guard let querySnapshot = querySnapshot else {
                self.logger.error("Failed to fetch platforms with error: \(error?.localizedDescription ?? "unknown")")
                return
            }
            self.platforms = querySnapshot.documents.compactMap { try? $0.data(as: Platform.self) }
                    .reduce(into: [String: Platform]()) { $0[$1.id!] = $1 }

            self.logger.info("Fetched \(self.platforms.count) platforms")
        }
    }

    private func unsubscribeFromPlatforms() {
        platformsListener?.remove()
    }

    private func addPlatformData(to game: inout Game) {
        game.platformsData = game.platforms.compactMap { platforms[$0] }
    }

    private func addPlatformData(to games: inout [Game]) {
        for (index, game) in games.enumerated() {
            games[index].platformsData = game.platforms.compactMap { platforms[$0] }
        }
    }

    private func addStatus(for game: inout Game, userId: String) async throws {
        guard let item = try await collectionService.getCollectionItem(for: game.id!, userId: userId) else {
            return
        }

        game.status = item.status
    }

    private func addStatus(for games: inout [Game], userId: String) async throws {
        let items = try await collectionService.getCollectionItems(for: games.map { $0.id! }, userId: userId)
        for (index, item) in items.enumerated() {
            games[index].status = item.status
        }
    }

    private func addStatus(for games: inout [Game], status: Game.Status){
        games.indices.forEach { games[$0].status = status }
    }
}
