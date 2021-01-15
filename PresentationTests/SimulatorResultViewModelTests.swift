//
//  SimulatorResultViewModelTests.swift
//  PresentationTests
//
//  Created by Robson Moreira on 14/01/21.
//

import XCTest
@testable import Presentation
@testable import Domain

class SimulatorResultViewModelTests: XCTestCase {
    
    var viewModel: SimulatorResultViewModel!
    
    override func setUpWithError() throws {
        let string = "{\"investmentParameter\":{\"investedAmount\":32323,\"yearlyInterestRate\":9.5512,\"maturityTotalDays\":1981,\"maturityBusinessDays\":1409,\"maturityDate\":\"2023-03-03T00:00:00\",\"rate\":123,\"isTaxFree\":false},\"grossAmount\":60528.2,\"taxesAmount\":4230.78,\"netAmount\":56297.42,\"grossAmountProfit\":28205.2,\"netAmountProfit\":23974.42,\"annualGrossRateProfit\":87.26,\"monthlyGrossRateProfit\":0.76,\"dailyGrossRateProfit\":0.000445330025305748,\"taxesRate\":15,\"rateProfit\":9.5512,\"annualNetRateProfit\":74.17}"
        let data = string.data(using: .utf8)!
        
        do {
            let simulation = try JSONDecoder().decode(Simulation.self, from: data)
            self.viewModel = SimulatorResultViewModel(simulation: simulation)
        } catch {
            self.viewModel = nil
        }
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
    }
    
    func testGrossAmount_NotNul() throws {
        XCTAssertNotNil(self.viewModel.grossAmount)
    }
    
    func testAppliedAmount_NotNul() throws {
        XCTAssertNotNil(self.viewModel.appliedAmount)
    }
    
    func testGrossAmountProfit_NotNul() throws {
        XCTAssertNotNil(self.viewModel.grossAmountProfit)
    }
    
    func testTaxesAmount_NotNul() throws {
        XCTAssertNotNil(self.viewModel.taxesAmount)
    }
    
    func testTaxesRate_NotNul() throws {
        XCTAssertNotNil(self.viewModel.taxesRate)
    }
    
    func testNetAmount_NotNul() throws {
        XCTAssertNotNil(self.viewModel.netAmount)
    }
    
    func testRedemptionDate_NotNul() throws {
        XCTAssertNotNil(self.viewModel.redemptionDate)
    }
    
    func testMaturityTotalDays_NotNul() throws {
        XCTAssertNotNil(self.viewModel.maturityTotalDays)
    }
    
    func testMonthlyGrossRateProfit_NotNul() throws {
        XCTAssertNotNil(self.viewModel.monthlyGrossRateProfit)
    }
    
    func testRate_NotNul() throws {
        XCTAssertNotNil(self.viewModel.rate)
    }
    
    func testAnnualGrossRateProfit_NotNul() throws {
        XCTAssertNotNil(self.viewModel.annualGrossRateProfit)
    }
    
    func testRateProfit_NotNul() throws {
        XCTAssertNotNil(self.viewModel.rateProfit)
    }

}
