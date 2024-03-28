//
//  GameDetailsViewModel.swift
//  GamesList
//
//  Created by Admin on 28.03.2024.
//

import Foundation
import Factory

class GameDetailsViewModel: ObservableObject {
    @Injected(\.authenticationService) private var authenticationService
    @Injected(\.gameService) private var gameService

    @Published var game: Game

    init(game: Game) {
        self.game = game
    }

    var cover: String {
        game.cover
    }

    var title: String {
        game.title
    }

    var releaseDate: String {
        game.releaseDate
    }

    var platforms: String {
        game.platformsData?.map { $0.name }.joined(separator: ", ") ?? ""
    }

    var genres: String {
        game.genres.joined(separator: ", ")
    }

    var developer: String {
        game.developer
    }

    var publisher: String {
        game.publisher
    }

    var description: String {
        game.description
    }

    var screenshots: [String] {
        game.screenshots
    }

    @MainActor
    func fetchGame() async {
        guard let userId = authenticationService.userId else { return }
        
        do {
            game = try await gameService.getGame(by: game.id!, userId: userId)
        } catch {
            print(error)
        }
    }
}
