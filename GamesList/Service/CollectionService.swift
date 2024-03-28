//
// Created by Admin on 28.03.2024.
//

import Foundation

protocol CollectionService {
    func getCollectionItems(userId: String) async throws -> [CollectionItem]
    func getCollectionItem(for gameId: String, userId: String) async throws -> CollectionItem?
    func getCollectionItems(for gameIds: [String], userId: String) async throws -> [CollectionItem]
    func getCollectionItems(for status: Game.Status, userId: String) async throws -> [CollectionItem]
    func toggleStatus(for gameId: String, to status: Game.Status, userId: String) async throws -> Game.Status?

}
