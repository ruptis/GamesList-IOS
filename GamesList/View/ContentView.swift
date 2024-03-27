//
//  ContentView.swift
//  GamesList
//
//  Created by Admin on 11.03.2024.
//

import SwiftUI
import Factory

struct ContentView: View {
    @InjectedObject(\.contentViewModel) var viewModel

    var body: some View {
        Group {
            if viewModel.isLogged {
                MainTabView(selectedTab: $viewModel.selectedTab)
            } else {
                WelcomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        mockServices()
        return ContentView()
    }
}
