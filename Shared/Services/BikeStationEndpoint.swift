//
//  BikeStationEndpoint.swift
//  BikeStation (iOS)
//
//  Created by ft_admin on 05/06/22.
//

import Foundation

// API endpoints
enum BikeStationEndpoint {
    
    // get enpoints url from parameters mtype and co
    case get(mtype: String, co: String)
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(mtype, co):
            var components = URLComponents()
            components.scheme = baseURL.scheme
            components.host = baseURL.host
            components.path = baseURL.path + "/mim/plan/map_service.html"
            components.queryItems = [
                URLQueryItem(name: "mtype", value: mtype),
                URLQueryItem(name: "co", value: co)
            ].compactMap { $0 }
            return components.url!
        }
    }
}
