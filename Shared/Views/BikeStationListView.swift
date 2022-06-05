//
//  BikeStationListView.swift
//  BikeStation (iOS)
//
//  Created by ft_admin on 05/06/22.
//

import SwiftUI

struct BikeStationListView: View {
    @ObservedObject var viewModel: BikeStationViewModel
    var body: some View {
        List(viewModel.data) { station in
            ZStack {
                NavigationLink(destination:
                                BikeStationDetailView(station: station)
                ) {
                    EmptyView()
                }
                .opacity(0.0)
                .buttonStyle(.plain)
                
                BikeStationListRow(station: station)
            }
            
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
        .onAppear() {
            viewModel.fetchBikeStations()
        }
    }
}

struct BikeStationListView_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationListView(viewModel: BikeStationViewModel(service: BikeStationAPI(session: URLSession.shared)))
    }
}
