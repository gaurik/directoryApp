//
//  EmployeeDetailUITests.swift
//  VMDirectoryUITests
//
//  Created by Gauri Rohan on 08/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import XCTest

class EmployeeDetailUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }
    
    func testEmployeeDetailPage() {
        let app = XCUIApplication()
        app.launch()
        
        // tap on Employee tab
        let tabBar = app.tabBars["directoryTabBar"]
        tabBar.buttons["Employees"].tap()
        
        // check if the employee's tableView exist and tap first cell
        let table = app.tables["employeeListTable"]
        XCTAssert(table.exists)
        table.cells.firstMatch.tap()
        
        // check for all the UI elements on employee detail view
        let navigationBar = app.navigationBars["directoryNavigationBar"]
        XCTAssert(navigationBar.exists)
        XCTAssert(navigationBar.buttons["Virgin Money Directory"].exists)
        XCTAssert(app.images["employeeDefaultImage"].exists)
        XCTAssert(app.staticTexts["Kade Senger"].exists)
        XCTAssert(app.staticTexts["Job Title"].exists)
        XCTAssert(app.staticTexts["Job title is Internal Applications Designer"].exists)
        XCTAssert(app.staticTexts["Created at"].exists)
        XCTAssert(app.staticTexts["Email ID"].exists)
        XCTAssert(app.buttons["emailID is Louisa_Skiles@hotmail.com"].exists)
        XCTAssert(app.staticTexts["Location"].exists)
        XCTAssert(app.staticTexts["Lives in North Pacific Ocean"].exists)
        XCTAssert(app.staticTexts["Phone Number"].exists)
    }
}
    
