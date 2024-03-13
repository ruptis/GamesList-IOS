//
//  MainTabView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            GamesListView()
                    .tabItem {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : . none)
                    }
                    .tag(0)

            FavoritesView()
                    .tabItem {
                        Image(systemName: selectedTab == 1 ? "heart.fill" : "heart")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : . none)
                    }
                    .tag(1)

            ProfileView()
                    .tabItem {
                        Image(systemName: selectedTab == 2 ? "person.fill" : "person")
                            .environment(\.symbolVariants, selectedTab == 3 ? .fill : . none)
                    }
                    .tag(2)
        }
        .accentColor(Color(.systemIndigo))
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
