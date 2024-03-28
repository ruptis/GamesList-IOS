//
//  FavoritesView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//
//

import SwiftUI

struct CollectionView: View {
    @State var selectedTab: Int = 0

    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                CollectionListView(status: .Playing)
                    .tag(0)
                
                CollectionListView(status: .Planning)
                    .tag(1)
                
                CollectionListView(status: .Passed)
                    .tag(2)
                
                CollectionListView(status: .Abandoned)
                    .tag(3)
            }
            .tabViewStyle(.page)
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
