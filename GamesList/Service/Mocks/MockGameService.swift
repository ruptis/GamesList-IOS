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
             platforms: [Platform(name: "Platform", image: "platformImage")],
             genres: ["Action", "Adventure"],
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
    
    func getGames(filter: (Game) -> Bool, userId: String) async throws -> [Game] {
        games.filter(filter)
    }
    
    func getGame(by id: String, userId: String) async throws -> Game {
        guard let game = games.first(where: {$0.id == id}) else {
            throw ServiceError.invalidData
        }
        
        return game
    }
    
    func toggleStatus(for gameId: String, to status: Game.Status, userId: String) async throws -> Game.Status? {
        var game = try await getGame(by: gameId, userId: userId)
        
        print(status)
        
        if game.status == status {
            print("reset")
            game.status = nil
        } else {
            print("set")
            game.status = status
        }
        
        print("\(game.status?.rawValue ?? "nil")")
        return game.status
    }
}
