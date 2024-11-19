//
//  Array+Filtering.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import Foundation

extension Array {
    func partitioned(by predicate: (Element) -> Bool) -> [Element] {
        let match = self.filter(predicate)
        let nonMatch = self.filter { !predicate($0) }
        return match + nonMatch
    }
}
