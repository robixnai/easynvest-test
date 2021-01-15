//
//  GenericDataProvider.swift
//  gok-challenge
//
//  Created by Robson Moreira on 09/11/20.
//

import Foundation
import Domain

public protocol GenericDataProvider: class {
    
    func success(_ object: Simulation)
    func errorData(_ provider: GenericDataProvider?, error: NSError)
    
}

public class DataProviderManager<T, S> {
    
    public init() {}
    
    public var delegate: T?
    
}
