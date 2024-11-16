//
//  LocationRepositoryFactory.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import Foundation

struct LocationRepositoryFactory {
    static var locationRepository: LocationRepository {
        (ProcessInfo.processInfo.testing || ProcessInfo.processInfo.isPreview)
        ? LocationRepositoryMock()
        : LocationRepositoryImp()
    }
}
