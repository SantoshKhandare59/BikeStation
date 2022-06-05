//
//  BikeStationDataMapperTests.swift
//  BikeStationTests
//
//  Created by ft_admin on 05/06/22.
//

import XCTest
@testable import BikeStation

class BikeStationDataMapperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_bikestation_successOnvalidJSON() {
        let data = makeData()
        guard let result = try? BikeStationMapper.map(data) else {
            fatalError("Couldn't find parse data.")
        }
        XCTAssertFalse(result.isEmpty, "Expected non-empty json data")
    }
    
    func test_bikestation_throwsErrorOnInvalidJSON() {
        let invalidJSON = Data("invalid json".utf8)
        
        XCTAssertThrowsError(
            try BikeStationMapper.map(invalidJSON)
        )
    }
    
    private func makeData() -> Data {
        let data: Data
        let filename = "bikeStationData"
        let bundle = Bundle(for: Self.self)
        guard let file = bundle.path(forResource: filename, ofType: "json")
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: URL(fileURLWithPath: file))
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        return data
    }

}

