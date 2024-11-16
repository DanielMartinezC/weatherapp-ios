//
//  WeatherRepository+InjectedValues.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

extension InjectedValues {
    var weatherRepository: WeatherRepository {
        get { Self[WeatherProviderKey.self] }
        set { Self[WeatherProviderKey.self] = newValue }
    }
}
