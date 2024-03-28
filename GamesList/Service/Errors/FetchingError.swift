//
// Created by Admin on 28.03.2024.
//

import Foundation

class FetchingError: ServiceError {
    init(entity: String) {
        super.init(message: "Failed to fetch \(entity)")
    }
}
