//
//  BikeStationViewModel.swift
//  BikeStation (iOS)
//
//  Created by ft_admin on 05/06/22.
//

import Foundation
import Combine

/// View model to bind data and call api
final class BikeStationViewModel: ObservableObject {
    @Published var data = [BikeStation]()
    @Published var state: ResultState = .loading
    private let service: APIService
    private var cancellable: Cancellable?
    
    enum ResultState: Equatable {
        case loading
        case success
        case failure(String)
    }
    
    init(service: APIService) {
        self.service = service
    }
       
    ///
    func fetchBikeStations() {
        self.state = .loading
        let url = BikeStationEndpoint.get(mtype: "pub_transport", co: "stacje_rowerowe").url(baseURL: Constants.baseURL)
        let result = service.get(from: url)
        cancellable = result.sink { error in
            switch error {
                case .finished:
                    self.state = .success
                case .failure(let error):
                    self.state = .failure(error.localizedDescription)
            }
        } receiveValue: { values in
            self.data = values
        }
    }
}
