//
// Created by Admin on 14.03.2024.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    var name: String
    var email: String
    var birthDate: String
    var registrationDate: String
    var avatar: String
    var gender: String
    var bio: String
    var country: String
    var links: [String]
    var gamesCount: Int
    var passedGamesCount: Int
}

extension User {
    static var MOCK: User {
        User(id: "1",
                name: "Name",
                email: "example@gmail.com",
                birthDate: "01.01.2000",
                registrationDate: "01.01.2020",
                avatar: "avatar",
                gender: "male",
                bio: "bio",
                country: "country",
                links: ["link1", "link2"],
                gamesCount: 10,
                passedGamesCount: 5)
    }
}
