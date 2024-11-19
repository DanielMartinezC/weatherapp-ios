//
//  WeatherRepositoryFactory.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

struct WeatherRepositoryFactory {
    static var weatherRepository: WeatherRepository {
        (ProcessInfo.processInfo.testing || ProcessInfo.processInfo.isPreview)
        ? WeatherRepositoryMock()
        : WeatherRepositoryImp()
    }
}
