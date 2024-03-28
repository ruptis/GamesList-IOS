//
// Created by Admin on 28.03.2024.
//

import Foundation
import FirebaseFirestoreSwift

struct Platform: Hashable, Codable {
    @DocumentID var id: String?
    var abbreviation: String
    var name: String
}