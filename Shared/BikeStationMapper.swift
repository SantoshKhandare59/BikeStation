//
//  BikeStationMapper.swift
//  BikeStation (iOS)
//
//  Created by ft_admin on 05/06/22.
//

import Foundation

/// BikeStationMapper class used for model purpose
/// to enumerate API response
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
        
        var stations: [BikeStation] {
            features.map {
                BikeStation(id: $0.id, name: $0.properties.label, bikes: Int($0.properties.bikeRacks) ?? 0, availablebikes: Int($0.properties.bikes) ?? 0, coordinates: BikeStation.Coordinates(latitude: $0.geometry.coordinates[0], longitude: $0.geometry.coordinates[1]))
            }
        }
    }
    
    public enum Error: Swift.Error {
        case invalidData
    }
    
    // User this function to parse and map json data
    static func map(_ data: Data) throws -> [BikeStation] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)
        guard let root = try? decoder.decode(Root.self, from: data) else {
            throw Error.invalidData
        }
        return root.stations
    }
}
