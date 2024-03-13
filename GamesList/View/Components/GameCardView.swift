//
//  GameCardView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//

import SwiftUI

struct GameCardView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .infinity, height: 100)
                    .cornerRadius(10)
                    .clipped()
                    .padding(.bottom, 10)

            Text("Game")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

            Spacer()

            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Action")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)

                        Text("Adventure")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                    }

                    HStack {
                        Image(systemName: "desktopcomputer")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
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
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
        }
                .frame(width: .infinity, height: 200)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .shadow(color: Color(.systemGray), radius: 5, x: 0, y: 0)
    }
}

struct GameCardView_Previews: PreviewProvider {
    static var previews: some View {
        GameCardView().padding(10)
    }
}