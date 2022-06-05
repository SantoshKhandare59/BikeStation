//
//  BikeStationApp.swift
//  Shared
//
//  Created by ft_admin on 05/06/22.
//

import SwiftUI

@main
struct BikeStationApp: App {
    @StateObject private var viewModel = BikeStationViewModel(service: BikeStationAPI(session: URLSession.shared))
    var body: some Scene {
        WindowGroup {
            NavigationView {
                BikeStationListView(viewModel: viewModel)
            }
        }
    }
}
