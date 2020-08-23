//
//  TestandoUITests.swift
//  TestandoUITests
//
//  Created by Jon DeMaagd on 8/23/20.
//  Copyright © 2020 JON DEMAAGD. All rights reserved.
//

import XCTest

class TestandoUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testClickToDetailView(){
        
        let app = XCUIApplication()
        app.tables.staticTexts["Highlander"].tap()
        app.navigationBars["inventoryapp.DetailView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
    }
    
    func testClickToViewAndBack(){
        
        let app = XCUIApplication()
        let table = app.tables["mainTable"]
        table.cells.staticTexts["Toyota"].tap()
        app.navigationBars["inventoryapp.DetailView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
    }
    
    func testAddOne() {
        XCUIApplication().navigationBars["inventoryapp.View"].buttons["Add"].tap()
        
        let app = XCUIApplication()
        let modelTextField = app.textFields["model"]
        modelTextField.tap()
        modelTextField.typeText("Tundra")
        
        let unitsTextField = app.textFields["units"]
        unitsTextField.tap()
        unitsTextField.typeText("10")
        
        let makeTextField = app.textFields["make"]
        makeTextField.tap()
        makeTextField.typeText("Toyota")
        
        app.buttons["Add"].tap()
        app.navigationBars["inventoryapp.AddView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        let table = app.tables["mainTable"]
        XCTAssertEqual(table.cells.count, 5)
    }
    
    func testAddOneDeleteSame() {
        
        XCUIApplication().navigationBars["inventoryapp.View"].buttons["Add"].tap()
        let app = XCUIApplication()

        let modelTextField = app.textFields["model"]
        modelTextField.tap()
        modelTextField.typeText("Tundra")
        
        let unitsTextField = app.textFields["units"]
        unitsTextField.tap()
        unitsTextField.typeText("10")
        
        let makeTextField = app.textFields["make"]
        makeTextField.tap()
        makeTextField.typeText("Toyota")
        
        app.buttons["Add"].tap()
        app.navigationBars["inventoryapp.AddView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        let maintableTable = app.tables["mainTable"]
        maintableTable.staticTexts["Tundra"].swipeLeft()
        maintableTable.buttons["Delete"].tap()
        
        XCTAssertEqual(maintableTable.cells.count, 4)
        
    }
    
    
    
    
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
