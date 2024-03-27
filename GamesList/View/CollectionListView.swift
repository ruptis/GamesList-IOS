//
//  CollectionListView.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//
//

import SwiftUI

struct CollectionListView: View {
    var status: Game.Status

    var body: some View {
        VStack {
            Text(status.rawValue.capitalized)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
            List {
                ForEach(0..<10) { _ in
                    GameRowView(game: Game.MOCK)
                }
            }
                    .listStyle(.plain)
        }
                .navigationTitle(status.rawValue.capitalized)
                .navigationBarTitleDisplayMode(.inline)
    }
}

struct CollectionListView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionListView(status: .Passed)
    }
}
