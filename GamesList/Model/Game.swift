//
// Created by Admin on 14.03.2024.
//

import Foundation
import FirebaseFirestoreSwift

struct Game: Identifiable, Hashable, Codable {
    @DocumentID var id: String?
    var title: String
    var releaseDate: String
    var platforms: [String]
    var genres: [String]
    var developer: String
    var publisher: String
    var description: String
    var screenshots: [String]
    var cover: String

    var platformsData: [Platform]?
    var status: Status?
    
    enum Status: String, CaseIterable, Codable {
        case Playing, Planning, Passed, Abandoned
    }
}
