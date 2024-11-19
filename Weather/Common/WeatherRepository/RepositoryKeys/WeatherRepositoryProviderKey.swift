//
//  WeatherRepositoryProviderKey.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

struct WeatherProviderKey: InjectionKey {
    static var currentValue: WeatherRepository = WeatherRepositoryFactory
        .weatherRepository
}
