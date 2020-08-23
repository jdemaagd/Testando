//
//  TestandoTests.swift
//  TestandoTests
//
//  Created by Jon DeMaagd on 8/23/20.
//  Copyright © 2020 JON DEMAAGD. All rights reserved.
//

import XCTest
@testable import Testando

class TestandoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()

        if InventoryManager.items.count != 4 {
            InventoryManager.init()
        }
    }
    
    override func tearDown() {
        super.tearDown()
        InventoryManager.items = []
    }
    
    func testAddItem() {
        let item = InventoryItem(name: "Rogue", units: 5, manufacturerName: "Nissan", dateAdded: "08/23/2020")
        
        InventoryManager.add(item: item)
        
        XCTAssertEqual(InventoryManager.items.count, 5)
    }
    
    func testAddItem2() {
        let item = InventoryItem(name: "Sentra", units: 5, manufacturerName: "Nissan", dateAdded: "08/23/2020")
        
        InventoryManager.add(item: item)
        
        XCTAssertEqual(InventoryManager.items.count, 5)
    }
    
    func testAddItemVerifyDetails() {
        let item = InventoryItem(name: "Sentra2", units: 4, manufacturerName: "Nissan", dateAdded: "08/23/2020")
        
        InventoryManager.add(item: item)
        
        let newItem = InventoryManager.items[InventoryManager.items.count - 1]
        
        XCTAssertEqual(newItem.name, "Sentra2")
        XCTAssertEqual(newItem.units, 4)
        XCTAssertEqual(newItem.manufacturerName, "Nissan")
    }
    
    func testDeleteItem(){
        InventoryManager.delete(index: 0)
        
        XCTAssertEqual(InventoryManager.items.count, 3)
    }
    
    func testInitInventoryItem() {
        let item = InventoryItem(name: "Volt", units: 7, manufacturerName: "Chevrolet", dateAdded: "2020-08-22 17:30:00 +0000")
        
        XCTAssertEqual(item.name, "Volt")
    }
    
    func testCellForRowAt() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InitialViewController") as! ViewController
        
        XCTAssertNotNil(vc.view, "Problem initializing view")
        vc.viewDidLoad()
        
        let cell = vc.tableView(vc.tableViewMain, cellForRowAt: IndexPath(row:0, section:0)) as! TableViewCell
        
        XCTAssertEqual(cell.name.text, "Highlander")
    }
}
