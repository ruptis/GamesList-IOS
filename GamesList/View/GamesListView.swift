//
//  GamesListView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//
//

import SwiftUI
import Factory

struct GamesListView: View {
    @State var games: [Game] = (0..<15).map { Game.Mock(id: "\($0)")}

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    ForEach($games, id: \.id) { $game in
                        NavigationLink(value: game) {
                            GameCardView(game: $game)
                                .padding(.horizontal, 10)
                        }
                    }
                }
            }
                .navigationTitle("Games")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: Game.self) { game in
                    GameDetailsView(game: game)
                }
        }
    }
}

struct GamesListView_Previews: PreviewProvider {
    static var previews: some View {
        GamesListView()
    }
}
