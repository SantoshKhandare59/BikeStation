//
//  Extensions.swift
//  BikeStation (iOS)
//
//  Created by ft_admin on 05/06/22.
//

import Foundation

// Extension - to get date custom formatter for validate json date
extension DateFormatter {
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        return formatter
    }()
}
