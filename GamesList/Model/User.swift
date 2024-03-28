//
// Created by Admin on 14.03.2024.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var email: String
    var country: String?
    var gender: Gender?
    var dateOfBirth: Date?
    var dateOfRegistration: Date
    var bio: String?
    var links: String?
    var gamesCount: Int = 0
    var passedGamesCount: Int = 0
    
    enum Gender: String, CaseIterable, Codable {
        case Female, Male, Other
    }
}
