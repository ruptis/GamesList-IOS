//
// Created by Admin on 28.03.2024.
//

import Foundation

class InvalidDataError: ServiceError {
    override init(message: String = "Invalid data") {
        super.init(message: message)
    }
}
