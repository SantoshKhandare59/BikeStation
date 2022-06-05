//
//  BikeStationEndpointTests.swift
//  BikeStationTests
//
//  Created by ft_admin on 05/06/22.
//

import XCTest
@testable import BikeStation

class BikeStationEndpointTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_bikestation_endpointURL() {
        let baseURL = URL(string: "http://www.poznan.pl")!
            
        let received = BikeStationEndpoint.get(mtype: "pub_transport", co: "stacje_rowerowe").url(baseURL: baseURL)
        let expected = URL(string: "http://www.poznan.pl/mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe")!
        
        XCTAssertEqual(received.scheme, "http", "scheme")
        XCTAssertEqual(received.host, "www.poznan.pl", "host")
        XCTAssertEqual(received.path, "/mim/plan/map_service.html", "path")
        XCTAssertEqual(received.query?.contains("mtype=pub_transport"), true, "mtype query param")
        XCTAssertEqual(received.query?.contains("co=stacje_rowerow"), true, "co query param")
        XCTAssertEqual(received, expected)
    }

}
