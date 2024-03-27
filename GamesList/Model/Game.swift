//
// Created by Admin on 14.03.2024.
//

import Foundation

struct Game: Identifiable, Hashable, Codable {
    var id: String
    var title: String
    var releaseDate: String
    var platforms: [Platform]
    var genres: [String]
    var developer: String
    var publisher: String
    var description: String
    var screenshots: [String]
    var cover: String
    
    var status: Status?
    
    struct Platform: Hashable, Codable {
        var name: String
        var image: String
    }
    
    enum Status: String, CaseIterable, Codable {
        case Playing, Planning, Passed, Abandoned
    }
}
