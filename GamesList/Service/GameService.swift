//
//  GameService.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

protocol GameService {
    func getGames(userId: String) async throws -> [Game]
    func getGames(by status: Game.Status, userId: String) async throws -> [Game]
    func getGame(by id: String, userId: String) async throws -> Game
}
