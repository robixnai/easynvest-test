//
//  InvestmentParameter.swift
//  Domain
//
//  Created by Robson Moreira on 14/01/21.
//

import Foundation

public struct InvestmentParameter : Codable {
    
    public let investedAmount : Double?
    public let yearlyInterestRate : Double?
    public let maturityTotalDays : Int?
    public let maturityBusinessDays : Int?
    public let maturityDate : String?
    public let rate : Double?
    public let isTaxFree : Bool?

    enum CodingKeys: String, CodingKey {
        case investedAmount = "investedAmount"
        case yearlyInterestRate = "yearlyInterestRate"
        case maturityTotalDays = "maturityTotalDays"
        case maturityBusinessDays = "maturityBusinessDays"
        case maturityDate = "maturityDate"
        case rate = "rate"
        case isTaxFree = "isTaxFree"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        investedAmount = try values.decodeIfPresent(Double.self, forKey: .investedAmount)
        yearlyInterestRate = try values.decodeIfPresent(Double.self, forKey: .yearlyInterestRate)
        maturityTotalDays = try values.decodeIfPresent(Int.self, forKey: .maturityTotalDays)
        maturityBusinessDays = try values.decodeIfPresent(Int.self, forKey: .maturityBusinessDays)
        maturityDate = try values.decodeIfPresent(String.self, forKey: .maturityDate)
        rate = try values.decodeIfPresent(Double.self, forKey: .rate)
        isTaxFree = try values.decodeIfPresent(Bool.self, forKey: .isTaxFree)
    }

}
