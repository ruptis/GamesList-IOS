//
//  GameActionsViewModel.swift
//  GamesList
//
//  Created by Admin on 28.03.2024.
//

import Foundation
import SwiftUI
import Factory

class GameActionsViewModel: ObservableObject {
    @Injected(\.authenticationService) private var authenticationService
    @Injected(\.collectionService) private var collectionService
    
    @Binding private var game: Game

    init(game: Binding<Game>) {
        self._game = game
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
        
        print("Toggle from \(game.status?.rawValue ?? "nil") to \(status.rawValue)")
        
        do {
            game.status = try await collectionService.toggleStatus(for: game.id!, to: status, userId: userId)
        } catch {
            print(error)
        }
    }
}
