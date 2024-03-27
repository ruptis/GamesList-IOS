//
//  GameCardView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//

import SwiftUI

struct GameCardView: View {
    @ObservedObject var viewModel: GameCardViewModel
    
    init(game: Binding<Game>) {
        viewModel = GameCardViewModel(game: game)
    }
    
    var body: some View {
        HStack {
            Image(viewModel.cover)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: .infinity)
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
                        ForEach(viewModel.genres, id: \.self) {
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
                            Image($0)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .background(.gray)
                        }
                    }
                }
                    
                HStack {
                    Spacer()
                    
                    Button(action: {
                        viewModel.togglePlayingStatus()
                    }) {
                        Image(systemName: "gamecontroller.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .foregroundColor(viewModel.hasPlayingStatus ? .purple : .secondary)
                            .padding(5)
                            .background(Circle()
                                .stroke(lineWidth: 3)
                                .foregroundColor(viewModel.hasPlayingStatus ? .purple : .secondary))
                    }
                    Button(action: {
                        viewModel.togglePlanningStatus()
                    }) {
                        Image(systemName: "clock.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                            .foregroundColor(viewModel.hasPlanningStatus ? .orange : .secondary)
                    }
                    Button(action: {
                        viewModel.togglePassedStatus()
                    }) {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                            .foregroundColor(viewModel.hasPassedStatus ? .green : .secondary)
                    }
                    Button(action: {
                        viewModel.toggleAbandonedStatus()
                    }) {
                        Image(systemName: "pause.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                            .foregroundColor(viewModel.hasAbandonedStatus ? .blue : .secondary)
                    }
                }
            }
            .padding(10)
        }
            .frame(width: .infinity, height: 160)
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
