//
//  GameActionsView.swift
//  GamesList
//
//  Created by Admin on 28.03.2024.
//

import SwiftUI

struct GameActionsView: View {
    @ObservedObject var viewModel: GameActionsViewModel
    var buttonsSize: CGFloat
    
    init(game: Binding<Game>, buttonsSize: CGFloat) {
        self.buttonsSize = buttonsSize
        viewModel = GameActionsViewModel(game: game)
    }
    
    private var frameSize: CGFloat {
        buttonsSize - padding * 2 - 3
    }
    
    private var padding: CGFloat {
        buttonsSize / 7
    }
    
    private var lineWidth: CGFloat {
        buttonsSize / 11.666
    }
    
    var body: some View {
        HStack {
            Button(action: {
                viewModel.togglePlayingStatus()
            }) {
                Image(systemName: "gamecontroller.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: frameSize, height: frameSize)
                    .foregroundColor(viewModel.hasPlayingStatus ? .purple : .secondary)
                    .padding(padding)
                    .background(Circle()
                        .stroke(lineWidth: lineWidth)
                        .foregroundColor(viewModel.hasPlayingStatus ? .purple : .secondary))
            }
            Button(action: {
                viewModel.togglePlanningStatus()
            }) {
                Image(systemName: "clock.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: buttonsSize, height: buttonsSize)
                    .foregroundColor(viewModel.hasPlanningStatus ? .orange : .secondary)
            }
            Button(action: {
                viewModel.togglePassedStatus()
            }) {
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: buttonsSize, height: buttonsSize)
                    .foregroundColor(viewModel.hasPassedStatus ? .green : .secondary)
            }
            Button(action: {
                viewModel.toggleAbandonedStatus()
            }) {
                Image(systemName: "pause.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: buttonsSize, height: buttonsSize)
                    .foregroundColor(viewModel.hasAbandonedStatus ? .blue : .secondary)
            }
        }
    }
}

struct GameActionsView_Previews: PreviewProvider {
    @State static var game = Game.MOCK
    static var previews: some View {
        GameActionsView(game: $game, buttonsSize: 35)
    }
}
