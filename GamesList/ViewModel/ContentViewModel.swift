//
//  ContentViewModel.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation
import Factory
import Combine

class ContentViewModel: ObservableObject {
    @Injected(\.authenticationService) private var authenticationService

    var cancellable: AnyCancellable?

    init() {
        cancellable = authenticationService.userIdPublisher.assign(to: \.userId, on: self)
    }

    @MainActor
    @Published var userId: String? {
        didSet {
            isLogged = userId != nil
        }
    }
    @Published var isLogged = false
    @Published var selectedTab = 0
}
