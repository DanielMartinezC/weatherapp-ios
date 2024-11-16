//
//  LocationRepository.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import Foundation
import CoreLocation

protocol LocationRepository {
    func requestLocation() async throws -> CLLocation
    func requestWhenInUseAuthorization() async throws
}
