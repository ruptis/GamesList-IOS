//
//  GameDetails.swift
//  GamesList
//
//  Created by Admin on 14.03.2024.
//
//

import SwiftUI
import Factory
import Kingfisher

struct GameDetailsView: View {
    @ObservedObject var viewModel: GameDetailsViewModel

    init(game: Game) {
        viewModel = GameDetailsViewModel(game: game)
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    KFImage(URL(string: viewModel.cover))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: 300)
                        .clipped()
                        .background(Color.gray)
                    
                    VStack(spacing: 10) {
                        Text(viewModel.title)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                        
                        GameActionsView(game: $viewModel.game, buttonsSize: 50)
                        
                        VStack(alignment: .leading) {
                            InfoRowView(title: "Genres", value: viewModel.genres)
                            InfoRowView(title: "Platforms", value: viewModel.platforms)
                            InfoRowView(title: "Release Date", value: viewModel.releaseDate)
                            InfoRowView(title: "Developer", value: viewModel.developer)
                            InfoRowView(title: "Publisher", value: viewModel.publisher)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Description")
                                .font(.headline)
                            
                            Text(viewModel.description)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack {
                            Text("Screenshots")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(viewModel.screenshots, id: \.self) {
                                        KFImage(URL(string: $0))
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
                    .padding(.horizontal)
                }
                .task { await viewModel.fetchGame() }
            }
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct GameDetails_Previews: PreviewProvider {
    static var previews: some View {
        mockServices()
        return GameDetailsView(game: Game.MOCK)
    }
}
