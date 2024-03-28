//
// Created by Admin on 28.03.2024.
//

import Foundation
import FirebaseFirestoreSwift

struct CollectionItem: Codable {
    @DocumentID var gameId: String?
    var status: Game.Status
}
