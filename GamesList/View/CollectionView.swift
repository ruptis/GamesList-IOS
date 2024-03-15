//
//  FavoritesView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            // Want to play section
            VStack(alignment: .leading, spacing: 10) {
                Text("Want to play")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)

                LazyVStack(spacing: 10) {
                    ForEach(Game.MOCKS, id: \.id) { game in
                        NavigationLink(value: game) {
                            GameRowView(game: game)
                                .padding(.horizontal, 10)
                        }
                    }
                }
            }

            // Playing section
            VStack(alignment: .leading, spacing: 10) {
                Text("Playing")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)

                LazyVStack(spacing: 10) {
                    ForEach(Game.MOCKS, id: \.id) { game in
                        NavigationLink(value: game) {
                            GameRowView(game: game)
                                .padding(.horizontal, 10)
                        }
                    }
                }
            }

            // Finished section
            VStack(alignment: .leading, spacing: 10) {
                Text("Finished")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)

                LazyVStack(spacing: 10) {
                    ForEach(Game.MOCKS, id: \.id) { game in
                        NavigationLink(value: game) {
                            GameRowView(game: game)
                                .padding(.horizontal, 10)
                        }
                    }
                }
            }
        }
            .navigationTitle("Collection")
            .navigationBarTitleDisplayMode(.inline)
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
