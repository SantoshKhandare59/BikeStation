//
//  BikeStationDataMapperTests.swift
//  BikeStationTests
//
//  Created by ft_admin on 05/06/22.
//

import XCTest
import CoreLocation

class BikeStationDataMapperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

final class BikeStationMapper {
    private struct Root: Decodable {
        private struct Feature: Decodable {
            let id: String
            let geometry: Geometry
            let properties: Property
            struct Geometry: Decodable {
                let coordinates: [Double]
            }
            struct Property: Decodable {
                let freeRacks, bikes, label, bikeRacks: String
                let updated: Date
                enum CodingKeys: String, CodingKey {
                    case freeRacks = "free_racks"
                    case bikes, label
                    case bikeRacks = "bike_racks"
                    case updated
                }
            }
        }
        private let type: String
        private let features: [Feature]
    }
    
    public enum Error: Swift.Error {
        case invalidData
    }
}

struct BikeStation: Identifiable {
    let id: String
    let name: String
    let bikes: Int
    let availablebikes: Int
    
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates {
        var latitude: Double
        var longitude: Double
    }
}
