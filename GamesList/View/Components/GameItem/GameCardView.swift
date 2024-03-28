//
//  GameCardView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//

import SwiftUI
import Kingfisher

struct GameCardView: GameItemView {
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
                .aspectRatio(contentMode: .fill)
                .frame(width: 120)
                .cornerRadius(10)
                .clipped()
                .background(.gray)
            
            VStack(alignment: .leading, spacing: 15) {
                Text(viewModel.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                VStack(alignment: .leading) {
                    HStack {
                        ForEach(viewModel.genres.prefix(3), id: \.self) {
                            Text($0)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                                .padding(5)
                                .background(Color(.systemGray5))
                                .cornerRadius(5)
                        }
                    }
                    
                    HStack {
                        ForEach(viewModel.platformLogos, id: \.self) {
                            KFImage(URL(string: $0))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .background(.gray)
                        }
                    }
                }
                    
                HStack {
                    Spacer()
                    
                    actionsView
                }
            }
            .padding(10)
        }
            .frame(height: 160)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            .shadow(color: Color(.systemGray), radius: 5, x: 0, y: 0)
    }
}

struct GameCardView_Previews: PreviewProvider {
    @State static var game = Game.MOCK
    static var previews: some View {
        mockServices()
        return GameCardView(game: $game).padding(10)
    }
}
