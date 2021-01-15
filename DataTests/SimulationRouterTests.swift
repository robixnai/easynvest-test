//
//  SimulationRouterTests.swift
//  DataTests
//
//  Created by Robson Moreira on 15/01/21.
//

import XCTest
@testable import Data

class SimulationRouterTests: XCTestCase {

    func testURLRequest_NotThrow() throws {
        let urlRequest = try SimulationRouter.calculatorSimulate(investedAmount: 100.0, rate: 10.0, maturityDate: "2021-01-15").asURLRequest()
        XCTAssertNoThrow(urlRequest)
    }
    
}
