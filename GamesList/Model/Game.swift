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
}

struct Platform: Hashable, Codable {
    var name: String
    var image: String
}

extension Game {
    static var MOCK: Game {
        Game(id: "1",
             title: "Game Title",
             releaseDate: "01.01.2020",
             platforms: [Platform(name: "Platform", image: "platformImage")],
             genres: ["Action", "Adventure"],
             developer: "Developer",
             publisher: "Publisher",
             description: "Game description",
             screenshots: ["screenshot1", "screenshot2"],
             cover: "cover")
    }

    static var MOCKS: [Game] {
        [Game(id: "1",
              title: "Game Title",
              releaseDate: "01.01.2020",
              platforms: [Platform(name: "Platform", image: "platformImage")],
              genres: ["Action", "Adventure"],
              developer: "Developer",
              publisher: "Publisher",
              description: "Game description",
              screenshots: ["screenshot1", "screenshot2"],
              cover: "cover"),
         Game(id: "2",
              title: "Game Title",
              releaseDate: "01.01.2020",
              platforms: [Platform(name: "Platform", image: "platformImage")],
              genres: ["Action", "Adventure"],
              developer: "Developer",
              publisher: "Publisher",
              description: "Game description",
              screenshots: ["screenshot1", "screenshot2"],
              cover: "cover"),
         Game(id: "3",
              title: "Game Title",
              releaseDate: "01.01.2020",
              platforms: [Platform(name: "Platform", image: "platformImage")],
              genres: ["Action", "Adventure"],
              developer: "Developer",
              publisher: "Publisher",
              description: "Game description",
              screenshots: ["screenshot1", "screenshot2"],
              cover: "cover")]
    }
}
