//
//  GameRowView.swift
//  GamesList
//
//  Created by Admin on 14.03.2024.
//
//

import SwiftUI

struct GameRowView: View {
    var game: Game

    var body: some View {
        HStack {
            Image(game.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .background(Color.gray)

            VStack(alignment: .leading) {
                Text(game.title)
                    .font(.headline)
                    .fontWeight(.bold)

                HStack {
                    ForEach(game.genres, id: \.self) { genre in
                        Text(genre)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                            .padding(5)
                            .background(Color(.systemGray5))
                            .cornerRadius(5)
                    }
                }

                HStack {
                    ForEach(game.platforms, id: \.self) { platform in
                        Image(platform.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                }
            }

            Spacer()

            Button(action: {

            }) {
                Image(systemName: "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(.red)
            }
        }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct GameRowView_Previews: PreviewProvider {
    static var previews: some View {
        GameRowView(game: Game.MOCK)
    }
}
