//
//  BikeStationDetailView.swift
//  BikeStation (iOS)
//
//  Created by ft_admin on 05/06/22.
//

import SwiftUI

struct BikeStationDetailView: View {
    let station: BikeStation
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BikeStationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationDetailView(station: BikeStation(id: "1", name: "Bike station", bikes: 12, availablebikes: 8, coordinates: BikeStation.Coordinates(latitude: 8.0, longitude: 6.0)))
    }
}
