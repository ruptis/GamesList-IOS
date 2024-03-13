//
//  GamesListView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//
//

import SwiftUI

struct GamesListView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0..<10) { _ in
                        GameCardView().padding(10)
                    }
                }
            }
                    .navigationTitle("Games")
        }
    }
}

struct GamesListView_Previews: PreviewProvider {
    static var previews: some View {
        GamesListView()
    }
}
