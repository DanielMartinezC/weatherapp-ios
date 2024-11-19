//
//  LocationRepositoryProviderKey.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import Foundation

struct LocationProviderKey: InjectionKey {
    static var currentValue: LocationRepository = LocationRepositoryFactory
        .locationRepository
}
