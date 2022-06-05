//
//  Constants.swift
//  BikeStation (iOS)
//
//  Created by ft_admin on 05/06/22.
//

import Foundation

enum Constants {
    static var baseURL: URL {
        guard let value = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String else {
            return URL(string: "http://www.poznan.pl")!
        }
        return URL(string: value)!
    }
}
