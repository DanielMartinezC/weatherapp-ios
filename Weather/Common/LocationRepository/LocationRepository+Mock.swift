//
//  LocationRepository+Mock.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import Foundation
import CoreLocation

class LocationRepositoryMock: LocationRepository {
    
    private let montevideoCoordinates = (latitude: -34.901, longitude: -56.1645)
    
    func requestLocation() async throws -> CLLocation {
        
        await Utils.setupTimerIfNeeded()
        
        return CLLocation.init(latitude: montevideoCoordinates.latitude, longitude: montevideoCoordinates.longitude)
    }
    
    func requestWhenInUseAuthorization() async throws {
        await Utils.setupTimerIfNeeded()
        return
    }
    
}
