//
//  GameDetails.swift
//  GamesList
//
//  Created by Admin on 14.03.2024.
//
//

import SwiftUI

struct GameDetailsView: View {
    var game: Game

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                Image(game.cover)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .background(Color.gray)

                VStack(spacing: 10) {
                    Text(game.title)
                        .font(.title)
                        .fontWeight(.bold)

                    VStack(alignment: .leading) {
                        InfoRowView(title: "Release Date", value: game.releaseDate)
                        InfoRowView(title: "Platform", value: game.platforms.map {$0.name}.joined(separator: ", "))
                        InfoRowView(title: "Genres", value: game.genres.joined(separator: ", "))
                        InfoRowView(title: "Developer", value: game.developer)
                        InfoRowView(title: "Publisher", value: game.publisher)
                    }
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text(game.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    VStack {
                        Text("Screenshots")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(game.screenshots, id: \.self) { screenshot in
                                    Image(screenshot)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 200)
                                        .cornerRadius(10)
                                        .background(Color.gray)
                                }
                            }
                        }
                    }
                }
                    .padding(.horizontal, 10)
            }
        }
            .navigationTitle(game.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct GameDetails_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailsView(game: Game.MOCK)
    }
}
