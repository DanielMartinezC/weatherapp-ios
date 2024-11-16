//
//  LocationRepository+Mock+Failure.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import Foundation
import CoreLocation

class LocationRepositoryMockFailure: LocationRepository {
    
    func requestLocation() async throws -> CLLocation {
        
        await Utils.setupTimerIfNeeded()
        
        throw LocationError.unauthorized
    }
    
    func requestWhenInUseAuthorization() async throws {
        await Utils.setupTimerIfNeeded()
        return
    }
    
}
