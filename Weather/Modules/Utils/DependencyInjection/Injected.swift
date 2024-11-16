//
//  Injected.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

@propertyWrapper
public struct Injected<T> {
    public let keyPath: WritableKeyPath<InjectedValues, T>
    public var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }
    
    public init(_ keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }
}
