//
//  ServiceError.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation

class NotFoundError: ServiceError {
    init(entity: String) {
        super.init(message: "\(entity) not found")
    }
}
