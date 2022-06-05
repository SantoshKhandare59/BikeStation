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
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failure(let error):
                Text(error)
                    .font(.headline)
                    .foregroundColor(.red)
            case .success:
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.data, id: \.id) { station in
                            ZStack {
                                Color.white
                                NavigationLink(destination:
                                                BikeStationDetailView(station: station)
                                ) {
                                    EmptyView()
                                }
                                .opacity(0.0)
                                .buttonStyle(.plain)
                                
                                BikeStationListRow(station: station)
                            }
                            .padding(.horizontal, 8)
                            .cornerRadius(20)
                            .shadow(radius: 1.0, x: 0, y: 2)
                        }
                    }
                }
            }
        }
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
