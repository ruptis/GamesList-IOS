//
//  GamesListView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//
//

import SwiftUI
import Factory

struct HomeView: View {
    var body: some View {
        NavigationStack {
            GameListView<GameCardView>(title: "Games")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
