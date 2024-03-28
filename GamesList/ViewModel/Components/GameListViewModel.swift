//
//  CollectionListViewModel.swift
//  GamesList
//
//  Created by Admin on 28.03.2024.
//

import Foundation
import Factory

class GameListViewModel: ObservableObject {
    @Injected(\.authenticationService) var authenticationService
    @Injected(\.gameService) var gameService

    private let status: Game.Status?
    
    init(status: Game.Status? = nil) {
        self.status = status
    }
    
    @Published var games: [Game] = []
    
    @MainActor
    func fetchCafes() async {
        guard let userId = authenticationService.userId else { return }
        
        do {
            guard let status = self.status else {
                games = try await gameService.getGames(userId: userId)
                return
            }
            
            games = try await gameService.getGames(by: status, userId: userId)
        } catch {
            print(error)
        }
    }
    
    func onGameUpdated(game: Game) {
        guard let status = self.status else { return }
        
        if game.status != status {
            games.removeAll { $0.id == game.id }
        }
    }
}
