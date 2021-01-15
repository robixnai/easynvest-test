//
//  ProductsDataProvider.swift
//  gok-challenge
//
//  Created by Robson Moreira on 09/11/20.
//

import Foundation
import Domain

public protocol SimulationDataProviderProtocol: GenericDataProvider {}

public class SimulationDataProviderManeger: DataProviderManager <SimulationDataProviderProtocol, Simulation> {
    
    public override init() {}
    
    public func getSimulation(investedAmount: Double, rate: Double, maturityDate: String) {
        SimulationAPIStore().getSimulation(investedAmount: investedAmount, rate: rate, maturityDate: maturityDate) { (simulation, error) in
            if error == nil {
                if let simulation = simulation {
                    self.delegate?.success(simulation)
                }
            } else {
                self.delegate?.errorData(self.delegate, error: error! as NSError)
            }
        }
    }
    
}
