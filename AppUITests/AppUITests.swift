//
//  AppUITests.swift
//  AppUITests
//
//  Created by Robson Moreira on 21/12/20.
//

import XCTest

class AppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
    }

    func testSimulate() {
        
        let app = XCUIApplication()
        let diaMSAnoTextField = app.textFields["dia/mês/ano"]
        diaMSAnoTextField.tap()
        diaMSAnoTextField.tap()
        app.datePickers.collectionViews.buttons["Saturday, January 16"].otherElements.containing(.staticText, identifier:"16").element.tap()
        app.textFields["%"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Simular"]/*[[".buttons[\"Simular\"].staticTexts[\"Simular\"]",".staticTexts[\"Simular\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Erro"].scrollViews.otherElements.buttons["OK"].tap()
        
    }
}
