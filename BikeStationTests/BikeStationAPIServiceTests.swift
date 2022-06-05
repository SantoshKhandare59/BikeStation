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

    private var cancellable: Cancellable?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getFromURL_succeedsOnHTTPURLResponseWithData() {
        let data = makeData()
        let response = HTTPURLResponse(url: anyURL(), statusCode: 200, httpVersion: nil, headerFields: nil)!
        URLProtocolStub.stub(data: data, response: response, error: nil)
        
        let sut = makeSUT()
        let exp = expectation(description: "Wait for completion")
        
        let result = sut.get(from: anyURL())
        cancellable = result.sink { error in
            switch error {
                case .finished:
                    print("success")
                case .failure(let error):
                    XCTFail("Expected successful api result, got \(error) instead")
            }
        } receiveValue: { values in
            XCTAssertEqual(values.count, 179, "Expected valid data from API")
            exp.fulfill()
        }

        wait(for: [exp], timeout: 2.0)
    }
    
    func test_getFromURL_failsOnAllInvalidResponseCases() {
        let data = Data()
        let response = HTTPURLResponse(url: anyURL(), statusCode: 400, httpVersion: nil, headerFields: nil)!
        URLProtocolStub.stub(data: data, response: response, error: nil)
        let sut = makeSUT()
        let exp = expectation(description: "Wait for completion")
        
        let result = sut.get(from: anyURL())
        cancellable = result.sink { error in
            switch error {
                case .finished:
                    print("success")
                case .failure(let error):
                XCTAssertEqual(error.localizedDescription, APIServiceError.serverError.localizedDescription)
                    exp.fulfill()
            }
        } receiveValue: { values in
        }
        wait(for: [exp], timeout: 2.0)
    }
    
    private func makeSUT() -> APIService {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolStub.self]
        let session = URLSession(configuration: configuration)
        
        let sut = BikeStationAPI(session: session)
        return sut
    }
    
    private func anyURL() -> URL {
        return URL(string: "http://any-url.com")!
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




