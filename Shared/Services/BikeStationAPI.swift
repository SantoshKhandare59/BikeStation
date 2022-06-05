//
//  BikeStationAPI.swift
//  BikeStationTests
//
//  Created by ft_admin on 05/06/22.
//

import Foundation
import Combine

protocol APIService {
    func get(from url: URL) -> AnyPublisher<[BikeStation], Error>
}


/// API Request to get Bike station
final class BikeStationAPI: APIService {
    private let session: URLSession
    public init(session: URLSession) {
        self.session = session
    }
    
    /// Sending a GET request to backend call
    /// Receive response and parsing json
    func get(from url: URL) -> AnyPublisher<[BikeStation], Error> {
        return session.dataTaskPublisher(for: url)
            .mapError { error -> Error in
                return APIServiceError.networkError(error)
            }
            .tryMap { output in
                guard let urlResponse = output.response as? HTTPURLResponse else {
                    throw APIServiceError.invalidResponse
                }
                guard self.isOK(urlResponse) else {
                    throw APIServiceError.serverError
                }
                return output.data
            }
            .tryMap { data in
                return try BikeStationMapper.map(data)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    /// Check for http response status
    private func isOK(_ response: HTTPURLResponse) -> Bool {
        (200...299).contains(response.statusCode)
    }
}
