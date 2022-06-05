//
//  APIServiceError.swift
//  BikeStationTests
//
//  Created by ft_admin on 05/06/22.
//

import Foundation

/// Handling of api calling and response errors
enum APIServiceError: Error {
    case networkError(Error)
    case invalidResponse
    case serverError
    case parsing
    
    var errorDescription: String? {
        switch self {
        case .networkError(let error):
            return "Transport error: \(error)"
        case .invalidResponse:
            return "Invalid response"
        case .serverError:
            return "Server not responsing"
        case .parsing:
            return "The server returned data in an unexpected format. Try updating the app."
        }
    }
}
