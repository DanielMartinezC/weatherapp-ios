//
//  City.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 13/11/24.
//

import Foundation

struct City: Identifiable, Hashable {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
}
