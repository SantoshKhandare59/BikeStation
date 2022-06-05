//
//  BikeStationAPIServiceTests.swift
//  BikeStationTests
//
//  Created by ft_admin on 05/06/22.
//

import XCTest
import Combine
@testable import BikeStation

class BikeStationAPIServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {

    }


}

protocol APIService {
    func get(from url: URL) -> AnyPublisher<[BikeStation], Error>
}

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
