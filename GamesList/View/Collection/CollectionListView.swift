//
//  CollectionListView.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//
//

import SwiftUI

struct CollectionListView: View {
    private let status: Game.Status
    
    init(status: Game.Status) {
        self.status = status
    }

    var body: some View {
        GameListView<GameRowView>(title: status.rawValue.capitalized, status: status)
    }
}

struct CollectionListView_Previews: PreviewProvider {
    static var previews: some View {
        mockServices()
        return CollectionListView(status: .Playing)
    }
}
