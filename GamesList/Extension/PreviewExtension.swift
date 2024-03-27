//
//  PreviewExtension.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation
import SwiftUI
import Factory

extension PreviewProvider {
    static func mockServices() {
        Container.shared.gameService.register(factory: {
            MockGameService()
        })

        Container.shared.userService.register(factory: {
            MockUserService()
        })

        Container.shared.authenticationService.register(factory: {
            MockAuthenticationService()
        })
    }
}
