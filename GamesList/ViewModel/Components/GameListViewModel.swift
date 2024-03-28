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
    
    private let filter: ((Game) -> Bool)?
    
    init(filter: ((Game) -> Bool)?) {
        self.filter = filter
    }
    
    @Published var games: [Game] = []
    
    @MainActor
    func fetchCafes() async {
        guard let userId = authenticationService.userId else { return }
        
        do {
            guard let filter = self.filter else {
                games = try await gameService.getGames(userId: userId)
                return
            }
            
            games = try await gameService.getGames(filter: filter, userId: userId)
        } catch {
            print(error)
        }
    }
    
    func onGameUpdated(game: Game) {
        guard let filter = self.filter else { return }
        
        if !filter(game) {
            games.removeAll(where: { $0.id == game.id } )
        }
    }
}
