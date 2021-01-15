//
//  SimulatorViewModel.swift
//  Presentation
//
//  Created by Robson Moreira on 14/01/21.
//

import Foundation
import Data
import Domain

public class SimulatorViewModel {
    
    var dataProvider: SimulationDataProviderManeger
    
    public var delegate: SimulatorViewModelDelegate?
    public var investedAmount: Double?
    public var rate: Double?
    public var maturityDate: String?
    
    public init(dataProvider: SimulationDataProviderManeger = SimulationDataProviderManeger()) {
        self.dataProvider = dataProvider
        self.dataProvider.delegate = self
    }
    
    public func getSimulation() {
        guard
            let investedAmount = self.investedAmount,
            let rate = self.rate,
            let maturityDate = self.maturityDate
        else {
            return
        }
        
        self.dataProvider.getSimulation(investedAmount: investedAmount, rate: rate, maturityDate: maturityDate)
    }
    
}

extension SimulatorViewModel: SimulationDataProviderProtocol {
    
    public func success(_ object: Simulation) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.success(SimulatorResultViewModel(simulation: object))
    }
    
    public func errorData(_ provider: GenericDataProvider?, error: NSError) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.errorData(error)
    }
    
}

public protocol SimulatorViewModelDelegate: class {
    
    func success(_ viewModel: SimulatorResultViewModel)
    func errorData(_ error: NSError)
    
}
