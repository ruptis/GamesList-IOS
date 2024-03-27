//
//  ServiceError.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import Foundation

class ServiceError: Error {
    static let invalidData = ServiceError()
    static let notFound = ServiceError()
}
