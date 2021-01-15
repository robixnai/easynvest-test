//
//  SimulatorViewModelDelegateTests.swift
//  PresentationTests
//
//  Created by Robson Moreira on 14/01/21.
//

import XCTest
import Foundation
import Presentation

class SimulatorViewModelDelegateTests: SimulatorViewModelDelegate {
    
    var successWithDelegateAsyncResult: SimulatorResultViewModel? = .none
    var errorDataWithDelegateAsyncResult: NSError? = .none
    var asyncExpectation: XCTestExpectation?
    
    func success(_ viewModel: SimulatorResultViewModel) {
        guard let expectation = asyncExpectation else {
            XCTFail("SimulatorViewModelDelegate was not setup correctly. Missing XCTExpectation reference")
            return
        }
        
        self.successWithDelegateAsyncResult = viewModel
        expectation.fulfill()
    }
    
    func errorData(_ error: NSError) {
        guard let expectation = asyncExpectation else {
            XCTFail("SimulatorViewModelDelegate was not setup correctly. Missing XCTExpectation reference")
            return
        }
        
        self.errorDataWithDelegateAsyncResult = error
        expectation.fulfill()
    }
    
}
