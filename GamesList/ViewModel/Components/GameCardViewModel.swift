//
//  GameCardViewModel.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation
import SwiftUI
import Factory

class GameCardViewModel: ObservableObject {
    @Injected(\.authenticationService) private var authenticationService
    @Injected(\.gameService) private var gameService

    @Binding private var game: Game

    init(game: Binding<Game>) {
        self._game = game
    }

    var cover: String {
        game.cover
    }

    var title: String {
        game.title
    }
    
    var genres: [String] {
        game.genres
    }
    
    var platformLogos: [String] {
        game.platforms.map { $0.image }
    }
    
    var hasPlayingStatus: Bool {
        game.status == Game.Status.Playing
    }
    
    var hasPlanningStatus: Bool {
        game.status == Game.Status.Planning
    }
    
    var hasPassedStatus: Bool {
        game.status == Game.Status.Passed
    }
    
    var hasAbandonedStatus: Bool {
        game.status == Game.Status.Abandoned
    }
    
    func togglePlayingStatus() {
        Task {
            await toggleStatus(status: .Playing)
        }
    }
    
    func togglePlanningStatus() {
        Task {
            await toggleStatus(status: .Planning)
        }
    }
    
    func togglePassedStatus() {
        Task {
            await toggleStatus(status: .Passed)
        }
    }
    
    func toggleAbandonedStatus() {
        Task {
            await toggleStatus(status: .Abandoned)
        }
    }

    @MainActor
    func toggleStatus(status: Game.Status) async {
        guard let userId = authenticationService.userId else { return }
        
        do {
            game.status = try await gameService.toggleStatus(for: game.id, to: status, userId: userId)
        } catch {
            print(error)
        }
    }
}