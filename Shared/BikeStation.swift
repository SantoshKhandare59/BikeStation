//
//  BikeStation.swift
//  BikeStation (iOS)
//
//  Created by ft_admin on 05/06/22.
//

import Foundation
import CoreLocation

/// BikeStation class used for model purpose
/// to map json data
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
