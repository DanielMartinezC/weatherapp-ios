//
//  LocationRepository+InjectedValues.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import Foundation

extension InjectedValues {
    var locationRepository: LocationRepository {
        get { Self[LocationProviderKey.self] }
        set { Self[LocationProviderKey.self] = newValue }
    }
}
