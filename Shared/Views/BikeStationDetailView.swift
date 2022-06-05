//
//  BikeStationDetailView.swift
//  BikeStation (iOS)
//
//  Created by ft_admin on 05/06/22.
//

import SwiftUI
import MapKit

struct BikeStationDetailView: View {
    let station: BikeStation
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: [station]) { loc in
                MapAnnotation(coordinate: loc.locationCoordinate) {
                    ZStack {
                        Color.white
                        Image("Bike").resizable()
                            .frame(width: 15, height: 15).padding(5)
                    }
                    .cornerRadius(10)
                    Text("\(station.bikes)").foregroundColor(.green)
                }
            }
            .ignoresSafeArea(edges: .top)
            BikeStationListRow(station: station)
        }
        .onAppear {
            setRegion()
        }
    }
    
    private func setRegion() {
        region = MKCoordinateRegion(
            center: station.locationCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    }
}

struct BikeStationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationDetailView(station: BikeStation(id: "1", name: "Bike station", bikes: 12, availablebikes: 8, coordinates: BikeStation.Coordinates(latitude: 8.0, longitude: 6.0)))
    }
}
