//
//  StringExtension.swift
//  App
//
//  Created by Robson Moreira on 14/01/21.
//

import UIKit

extension String {

    func currencyInputFormatting() -> String {
        var number: NSNumber!
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.currencySymbol = "R$ "
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2

        var amountWithPrefix = self

        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")

        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))

        guard number != 0 as NSNumber else {
            return ""
        }

        return formatter.string(from: number)!
    }
    
    func removeFormatAmount() -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.currencySymbol = "R$ "
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        return formatter.number(from: self) as! Double? ?? 0
    }
    
    func percent() -> String {
        var number: NSNumber!

        let formatter = NumberFormatter()
//        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.maximum = 100

        var amountWithPrefix = self

        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")

        let text = amountWithPrefix.replacingOccurrences(of: formatter.percentSymbol, with: "")
            .replacingOccurrences(of: formatter.groupingSeparator, with: "")
            .replacingOccurrences(of: formatter.decimalSeparator, with: "")

        let double = (text as NSString).doubleValue
        number = NSNumber(value: (double / 100))

        guard number != 0 as NSNumber else {
            return ""
        }

        return formatter.string(from: number)!
    }
    
}
