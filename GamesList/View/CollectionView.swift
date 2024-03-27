//
//  FavoritesView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//
//

import SwiftUI

struct CollectionView: View {
    @State var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            CollectionListView(status: .Playing)
                .tag(0)
                .tabItem {
                    Label("Played", systemImage: "checkmark")
                }

            CollectionListView(status: .Planning)
                .tag(1)
                .tabItem {
                    Label("Playing", systemImage: "gamecontroller")
                }

            CollectionListView(status: .Passed)
                .tag(2)
                .tabItem {
                    Label("Passed", systemImage: "star")
                }

            CollectionListView(status: .Abandoned)
                .tag(3)
                .tabItem {
                    Label("Abandoned", systemImage: "trash")
                }
        }
            .tabViewStyle(.page)
            .navigationDestination(for: Game.self) { game in
                GameDetailsView(game: game)
            }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
