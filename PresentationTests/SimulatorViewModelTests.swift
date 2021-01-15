//
//  PresentationTests.swift
//  PresentationTests
//
//  Created by Robson Moreira on 14/01/21.
//

import XCTest
@testable import Presentation
@testable import Domain

class SimulatorViewModelTests: XCTestCase {
    
    var viewMode: SimulatorViewModel!

    override func setUpWithError() throws {
        self.viewMode = SimulatorViewModel()
        self.viewMode.investedAmount = 32323.0
        self.viewMode.rate = 123.0
        self.viewMode.maturityDate = "2023-03-03"
    }

    override func tearDownWithError() throws {
        self.viewMode = nil
    }

    func testGetSimulation_WithSuccessNotNil() throws {
        let delegate = SimulatorViewModelDelegateTests()
        self.viewMode.delegate = delegate
        
        delegate.asyncExpectation = expectation(description: "SimulatorViewModelDelegate calls the delegate as the result of an async method completion")
        self.viewMode.getSimulation()
        
        waitForExpectations(timeout: 1) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            
            guard let result = delegate.successWithDelegateAsyncResult else {
                XCTFail("Expected delegate to be called")
                return
            }
            
            XCTAssertNotNil(result)
        }
    }
    
    func testGetSimulation_WithErrorNotNil() throws {
        let delegate = SimulatorViewModelDelegateTests()
        self.viewMode.delegate = delegate
        
        delegate.asyncExpectation = expectation(description: "SimulatorViewModelDelegate calls the delegate as the result of an async method completion")
        self.viewMode.getSimulation()
        
        waitForExpectations(timeout: 1) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            
            guard let result = delegate.errorDataWithDelegateAsyncResult else {
                XCTFail("Expected delegate to be called")
                return
            }
            
            XCTAssertNotNil(result)
        }
    }
    
    func testGetSimulation_WithError() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
