//
// Created by Admin on 28.03.2024.
//

import Foundation

class DecodingError: ServiceError {
    init(error: Error) {
        super.init(message: error.localizedDescription)
    }

    override init(message: String = "Decoding error") {
        super.init(message: message)
    }
}
