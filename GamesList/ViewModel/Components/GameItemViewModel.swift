//
//  GameCardViewModel.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation
import SwiftUI
import Factory

class GameItemViewModel: ObservableObject {
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
}
