//
//  ServiceError.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation

class ServiceError: Error {
    let message: String

    init(message: String = "An error occurred") {
        self.message = message
    }
}

extension ServiceError: LocalizedError {
    var errorDescription: String? {
        message
    }
}
