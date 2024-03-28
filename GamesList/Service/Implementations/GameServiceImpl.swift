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
//        guard var games = try? querySnapshot.documents.compactMap( { try $0.data(as: Game.self) } ) else {
//            logger.error("Failed to decode games")
//            throw DecodingError()
//        }
        var games: [Game]
        do {
            games = try querySnapshot.documents.compactMap( { try $0.data(as: Game.self) } )
        } catch {
            logger.error("\(error.localizedDescription)")
            throw DecodingError()
        }
        try await addStatus(for: &games, userId: userId)
        addPlatformData(to: &games)
        logger.info("Fetched \(games.count) games")
        return games
    }

    func getGames(filter: (Game) -> Bool, userId: String) async throws -> [Game] {
        var games = try await getGames(userId: userId)
        games = games.filter(filter)
        logger.info("Filtered \(games.count) games")
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

    func toggleStatus(for gameId: String, to status: Game.Status, userId: String) async throws -> Game.Status? {
        let game = try await getGame(by: gameId, userId: userId)
        let status = game.status
        let newStatus = status == status ? nil : status
        let data = try firestoreEncoder.encode(newStatus)
        try await getGamesCollection(for: userId).document(gameId).setData(data)
        logger.info("Status for game with id: \(gameId) toggled")
        return newStatus
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
        guard let document = try? await getGamesCollection(for: userId).document(game.id!).getDocument() else {
            return
        }

        guard let status = try? document.data(as: Game.Status.self) else {
            logger.error("Failed to decode status")
            throw DecodingError()
        }

        game.status = status
    }

    private func addStatus(for games: inout [Game], userId: String) async throws {
        guard let querySnapshot = try? await getGamesCollection(for: userId).getDocuments() else {
            return
        }

        let statuses = querySnapshot.documents.compactMap { try? $0.data(as: Game.Status.self) }
        for (index, status) in statuses.enumerated() {
            games[index].status = status
        }
    }

    private func getGamesCollection(for userId: String) -> CollectionReference {
        firestore.collection("users").document(userId).collection("games-collection")
    }
}
