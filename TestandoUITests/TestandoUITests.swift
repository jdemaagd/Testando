//
//  TestandoUITests.swift
//  TestandoUITests
//
//  Created by Jon DeMaagd on 8/23/20.
//  Copyright © 2020 JON DEMAAGD. All rights reserved.
//

import XCTest

class TestandoUITests: XCTestCase {

    var topLevelApp: XCUIApplication? = nil
    
    override func setUp() {
        super.setUp()

        continueAfterFailure = false

        XCUIApplication().launch()
        topLevelApp = XCUIApplication()
    }
    
    override func tearDown() {
        super.tearDown()
        
        topLevelApp = nil
    }
    
    func testAddOneItem() {
        //addOne()
        //XCTAssertEqual(topLevelApp?.tables["mainTable"].cells.count, 5)
    }
    
    func testClickToDetailView() {
        topLevelApp?.tables/*@START_MENU_TOKEN@*/.staticTexts["Highlander"]/*[[".cells.staticTexts[\"Highlander\"]",".staticTexts[\"Highlander\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        topLevelApp?.navigationBars["Testando.DetailView"].buttons["Back"].tap()
    }
    
    func testClickToViewAndBack() {
        let table = topLevelApp?.tables["mainTable"]
        table?.cells/*@START_MENU_TOKEN@*/.staticTexts["Altima"]/*[[".cells.staticTexts[\"Altima\"]",".staticTexts[\"Altima\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        topLevelApp?.navigationBars["Testando.DetailView"].buttons["Back"].tap()
    }
    
    func testDeleteOne() {
        let mainTable = topLevelApp?.tables["mainTable"]
        mainTable?.staticTexts["Highlander"].swipeLeft()
        mainTable?.buttons["Delete"].tap()
        
        XCTAssertEqual(mainTable?.cells.count, 3)
    }
    
    func addOne() {
        XCUIApplication().navigationBars["Testando.View"].buttons["Add"].tap()
        
        let modelTextField = topLevelApp?.textFields["model"]
        modelTextField?.tap()
        modelTextField?.typeText("Tundra")
        
        let unitsTextField = topLevelApp?.textFields["units"]
        unitsTextField?.tap()
        unitsTextField?.typeText("10")
        
        let makeTextField = topLevelApp?.textFields["make"]
        makeTextField?.tap()
        makeTextField?.typeText("Toyota")
        
        topLevelApp?.buttons["Add"].tap()
        //topLevelApp?.navigationBars["Testando.AddView"].buttons["Back"].tap()
        topLevelApp?.navigationBars["Testando.AddView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
    }
}
