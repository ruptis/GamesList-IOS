//
//  GameCardView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//

import SwiftUI

struct GameCardView: View {
    var game: Game

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .infinity, height: 90)
                .cornerRadius(10)
                .clipped()

            Text(game.title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            Spacer()

            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
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

                HStack(alignment: .bottom) {
                    Button(action: {

                    }) {
                        Image(systemName: "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.secondary)
                    }
                }
            }
                .padding(10)
        }
            .frame(width: .infinity, height: 200)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            .shadow(color: Color(.systemGray), radius: 5, x: 0, y: 0)
    }
}

struct GameCardView_Previews: PreviewProvider {
    static var previews: some View {
        GameCardView(game: Game.MOCK).padding(10)
    }
}
