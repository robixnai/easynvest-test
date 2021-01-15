//
//  Simulation.swift
//  Domain
//
//  Created by Robson Moreira on 14/01/21.
//

import Foundation

public struct Simulation: Codable {
    
    public let investmentParameter : InvestmentParameter?
    public let grossAmount : Double?
    public let taxesAmount : Double?
    public let netAmount : Double?
    public let grossAmountProfit : Double?
    public let netAmountProfit : Double?
    public let annualGrossRateProfit : Double?
    public let monthlyGrossRateProfit : Double?
    public let dailyGrossRateProfit : Double?
    public let taxesRate : Double?
    public let rateProfit : Double?
    public let annualNetRateProfit : Double?

    enum CodingKeys: String, CodingKey {
        case investmentParameter = "investmentParameter"
        case grossAmount = "grossAmount"
        case taxesAmount = "taxesAmount"
        case netAmount = "netAmount"
        case grossAmountProfit = "grossAmountProfit"
        case netAmountProfit = "netAmountProfit"
        case annualGrossRateProfit = "annualGrossRateProfit"
        case monthlyGrossRateProfit = "monthlyGrossRateProfit"
        case dailyGrossRateProfit = "dailyGrossRateProfit"
        case taxesRate = "taxesRate"
        case rateProfit = "rateProfit"
        case annualNetRateProfit = "annualNetRateProfit"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        investmentParameter = try values.decodeIfPresent(InvestmentParameter.self, forKey: .investmentParameter)
        grossAmount = try values.decodeIfPresent(Double.self, forKey: .grossAmount)
        taxesAmount = try values.decodeIfPresent(Double.self, forKey: .taxesAmount)
        netAmount = try values.decodeIfPresent(Double.self, forKey: .netAmount)
        grossAmountProfit = try values.decodeIfPresent(Double.self, forKey: .grossAmountProfit)
        netAmountProfit = try values.decodeIfPresent(Double.self, forKey: .netAmountProfit)
        annualGrossRateProfit = try values.decodeIfPresent(Double.self, forKey: .annualGrossRateProfit)
        monthlyGrossRateProfit = try values.decodeIfPresent(Double.self, forKey: .monthlyGrossRateProfit)
        dailyGrossRateProfit = try values.decodeIfPresent(Double.self, forKey: .dailyGrossRateProfit)
        taxesRate = try values.decodeIfPresent(Double.self, forKey: .taxesRate)
        rateProfit = try values.decodeIfPresent(Double.self, forKey: .rateProfit)
        annualNetRateProfit = try values.decodeIfPresent(Double.self, forKey: .annualNetRateProfit)
    }

}

