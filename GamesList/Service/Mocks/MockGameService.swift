//
//  MockGameService.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation

extension Game {
    static func Mock(id: String) -> Game {
        Game(id: id,
             title: "Game Title",
             releaseDate: "01.01.2020",
             platforms: [],
             genres: ["Action", "Adventureeeeeeeeeeeeeeeeeeeeeeeeee", "Other"],
             developer: "Developer",
             publisher: "Publisher",
             description: "Game description",
             screenshots: ["screenshot1", "screenshot2"],
             cover: "cover")
    }
    
    static let MOCK: Game = Mock(id: "0")
}

class MockGameService: GameService {
    private var games = (0..<30).map { Game.Mock(id: "\($0)")}
    
    func getGames(userId: String) async throws -> [Game] {
        games
    }
    
    func getGames(by status: Game.Status, userId: String) async throws -> [Game] {
        games.filter { $0.status == status }
    }
    
    func getGame(by id: String, userId: String) async throws -> Game {
        guard let game = games.first(where: {$0.id == id}) else {
            throw NotFoundError(entity: "Game")
        }
        
        return game
    }
    
    func toggleStatus(for gameId: String, to status: Game.Status, userId: String) async throws -> Game.Status? {
        guard let id = games.indices.first(where: { games[$0].id == gameId }) else {
            throw NotFoundError(entity: "Game")
        }

        var game = games[id]
        
        print("Changing \(game.status?.rawValue ?? "nil") to \(status.rawValue)")

        if game.status == status {
            print("reset")
            game.status = nil
        } else {
            print("set")
            game.status = status
        }
        
        print("\(game.status?.rawValue ?? "nil")")
        games[id] = game
        return game.status
    }
}
