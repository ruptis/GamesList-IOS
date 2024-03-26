//
//  GameCardView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//

import SwiftUI

struct GameCardView: View {
    var game: Game
    
    @State var isPresented = false
    
    var body: some View {
        HStack {
            Image(game.cover)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: .infinity)
                .cornerRadius(10)
                .clipped()
                .background(.gray)
            
            VStack(alignment: .leading, spacing: 15) {
                Text(game.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
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
                                .background(.gray)
                        }
                    }
                }
                    
                HStack {
                    Spacer()
                    
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: "gamecontroller.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .foregroundColor(.secondary)
                            .padding(5)
                            .background(Circle()
                                .stroke(lineWidth: 3)
                                .foregroundColor(.gray))
                    }
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: "clock.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.secondary)
                    }
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.secondary)
                    }
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: "pause.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.secondary)
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
    static var previews: some View {
        GameCardView(game: Game.MOCK).padding(10)
    }
}
