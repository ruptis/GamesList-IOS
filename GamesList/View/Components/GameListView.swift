//
//  GameListView.swift
//  GamesList
//
//  Created by Admin on 28.03.2024.
//

import SwiftUI

struct GameListView<GameItemViewType: GameItemView>: View {
    @ObservedObject var viewModel: GameListViewModel
    
    private let title: String
    
    init(title: String,
         status: Game.Status? = nil) {
        self.title = title
        viewModel = GameListViewModel(status: status)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 20) {
                ForEach($viewModel.games, id: \.id) { $game in
                    NavigationLink(value: game) {
                        GameItemViewType(game: $game)
                            .onChange(of: game, perform: { viewModel.onGameUpdated(game: $0) })
                            .padding(.horizontal, 10)
                    }
                }
            }
        }
        .refreshable { await viewModel.fetchCafes() }
        .task { await viewModel.fetchCafes() }
        .navigationTitle(title)
        .navigationDestination(for: Game.self) { game in
            GameDetailsView(game: game)
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        mockServices()
        return GameListView<GameCardView>(title: "Title")
    }
}
