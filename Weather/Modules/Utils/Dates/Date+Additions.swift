//
//  Date+Additions.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import Foundation

extension Int {
    func timestampToHMMA() -> String {
        // Convert timestamp to Date
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        // Create a DateFormatter and set the desired format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a" // 12-hour time with AM/PM
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        // Convert Date to formatted string
        return dateFormatter.string(from: date)
    }
}
