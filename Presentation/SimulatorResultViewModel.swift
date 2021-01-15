//
//  SimulatorResultViewModel.swift
//  Presentation
//
//  Created by Robson Moreira on 14/01/21.
//

import Foundation
import Domain

public class SimulatorResultViewModel {
    
    var simulation: Simulation?
    
    public var grossAmount: String? {
        guard
            let simulation = self.simulation,
            let grossAmount = simulation.grossAmount
        else { return nil }
        return "\(grossAmount)"
    }
    
    public var appliedAmount: String? {
        guard
            let simulation = self.simulation,
            let investmentParameter = simulation.investmentParameter,
            let investedAmount = investmentParameter.investedAmount
        else { return nil }
        return "\(investedAmount)"
    }
    
    public var grossAmountProfit: String? {
        guard
            let simulation = self.simulation,
            let grossAmountProfit = simulation.grossAmountProfit
        else { return nil }
        return "\(grossAmountProfit)"
    }
    
    public var taxesAmount: String? {
        guard
            let simulation = self.simulation,
            let taxesAmount = simulation.taxesAmount
        else { return nil }
        return "\(taxesAmount)"
    }
    
    public var taxesRate: String? {
        guard
            let simulation = self.simulation,
            let taxesRate = simulation.taxesRate
        else { return nil }
        return "\(taxesRate)"
    }
    
    public var netAmount: String? {
        guard
            let simulation = self.simulation,
            let netAmount = simulation.netAmount
        else { return nil }
        return "\(netAmount)"
    }
    
    public var redemptionDate: String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        guard
            let simulation = self.simulation,
            let investmentParameter = simulation.investmentParameter,
            let maturityDate = investmentParameter.maturityDate
        else { return nil }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: maturityDate)!
        
        return formatter.string(from: date)
    }
    
    public var maturityTotalDays: String? {
        guard
            let simulation = self.simulation,
            let investmentParameter = simulation.investmentParameter,
            let maturityTotalDays = investmentParameter.maturityTotalDays
        else { return nil }
        return "\(maturityTotalDays)"
    }
    
    public var monthlyGrossRateProfit: String? {
        guard
            let simulation = self.simulation,
            let monthlyGrossRateProfit = simulation.monthlyGrossRateProfit
        else { return nil }
        return "\(monthlyGrossRateProfit)%"
    }
    
    public var rate: String? {
        guard
            let simulation = self.simulation,
            let investmentParameter = simulation.investmentParameter,
            let rate = investmentParameter.rate
        else { return nil }
        return "\(rate)%"
    }
    
    public var annualGrossRateProfit: String? {
        guard
            let simulation = self.simulation,
            let annualGrossRateProfit = simulation.annualGrossRateProfit
        else { return nil }
        return "\(annualGrossRateProfit)%"
    }
    
    public var rateProfit: String? {
        guard
            let simulation = self.simulation,
            let rateProfit = simulation.rateProfit
        else { return nil }
        return "\(rateProfit)%"
    }
    
    public init(simulation: Simulation) {
        self.simulation = simulation
    }
    
}
