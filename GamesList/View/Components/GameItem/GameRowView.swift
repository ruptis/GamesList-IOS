//
//  GameRowView.swift
//  GamesList
//
//  Created by Admin on 14.03.2024.
//
//

import SwiftUI
import Kingfisher

struct GameRowView: GameItemView {
    @ObservedObject var viewModel: GameItemViewModel
    
    private let actionsView: GameActionsView
    
    init(game: Binding<Game>) {
        viewModel = GameItemViewModel(game: game)
        actionsView = GameActionsView(game: game, buttonsSize: 35)
    }

    var body: some View {
        HStack {
            KFImage(URL(string: viewModel.cover))
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 80)
                .background(Color.gray)

            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                        .lineLimit(1)

                HStack {
                    ForEach(viewModel.genres.prefix(2), id: \.self) {
                        Text($0)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                            .padding(5)
                            .background(Color(.systemGray5))
                            .cornerRadius(5)
                            .lineLimit(1)
                    }
                }

                HStack {
                    ForEach(viewModel.platforms.prefix(3), id: \.self) {
                        Text($0)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                            .padding(5)
                            .background(Color(.systemGray3))
                            .cornerRadius(5)
                            .lineLimit(1)
                    }
                }
            }

            HStack {
                Spacer()
                
                actionsView
            }
        }
            .padding(5)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct GameRowView_Previews: PreviewProvider {
    @State static var game = Game.MOCK
    static var previews: some View {
        GameRowView(game: $game).padding(.horizontal, 10)
    }
}
