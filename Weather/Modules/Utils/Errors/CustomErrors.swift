//
//  CustomErrors.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

enum CustomError: Error, Codable, Equatable, Hashable {
    // Common
    case notImplemented
    case mockError
    case unknownError
    case outOfService
    case customMessage(_ message: String)
    
}

extension CustomError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .notImplemented:
            return String.notImplementedError
        case .mockError:
            return String.mockError
        case .unknownError:
            return String.unknownError
        case .outOfService:
            return String.outOfService
        case .customMessage(let message):
            return message
        }
    }
}

