//
//  BikeStationListRow.swift
//  BikeStation (iOS)
//
//  Created by ft_admin on 05/06/22.
//

import SwiftUI

struct BikeStationListRow: View {
    let station: BikeStation
    var body: some View {
        NavigationLink(destination:
            BikeStationDetailView(station: station)
        ) {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(station.name)
                            .font(.title)
                            .bold()
                        Text("Bike Station")
                            .font(.body)
                        
                    }
                    Spacer()
                }.padding()
                HStack {
                    Spacer()
                    VStack {
                        Image("Bike")
                        Text("Available Bikes")
                            .font(.caption)
                        Text("\(station.bikes)")
                            .font(.system(size: 40))
                            .bold()
                            .foregroundColor(.green)
                    }
                    Spacer()
                    VStack {
                        Image("Lock")
                        Text("Available Places")
                            .font(.caption)
                        Text("\(station.availablebikes)")
                            .font(.system(size: 40))
                            .bold()
                    }
                    Spacer()
                }.padding(.bottom)
            }
        }.buttonStyle(.plain)
    }
}

struct BikeStationListRow_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationListRow(station: BikeStation(id: "1", name: "Bike station", bikes: 12, availablebikes: 8, coordinates: BikeStation.Coordinates(latitude: 8.0, longitude: 6.0)))
    }
}
