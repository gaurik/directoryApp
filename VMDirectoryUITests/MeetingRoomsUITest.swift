//
//  MeetingRoomsUITest.swift
//  VMDirectoryUITests
//
//  Created by Gauri Rohan on 07/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import XCTest

class MeetingRoomsUITest: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = false
    }
    
    func testUIElements() {
        let app = XCUIApplication()
        app.launch()
        
        let table = app.tables["meetingRoomListTable"]
        XCTAssert(table.exists)
        
        let navigationBar = app.navigationBars["directoryNavigationBar"]
        XCTAssert(navigationBar.exists)
        
        let tabBar = app.tabBars["directoryTabBar"]
        XCTAssert(tabBar.exists)
        
        XCTAssertEqual(tabBar.buttons.count, 2)
        
        //let meetingTabBarButton = tabBar.buttons["Meeting Rooms"]
        //XCTAssert(meetingTabBarButton.exists)
        
        let employeeTabBarButton = tabBar.buttons["Employees"]
        XCTAssert(employeeTabBarButton.exists)
    }
    
    func testMeetingRoomDetail() {
        let app = XCUIApplication()
        app.launch()
        
        let table = app.tables["meetingRoomListTable"]
        table.cells.firstMatch.tap()
        
        let navigationBar = app.navigationBars["directoryNavigationBar"]
        XCTAssert(navigationBar.exists)
        XCTAssert(navigationBar.buttons["Virgin Money Directory"].exists)
        
        XCTAssert(app.staticTexts["Moonside"].exists)
        XCTAssert(app.staticTexts["Room ID"].exists)
        XCTAssert(app.staticTexts["1"].exists)
        XCTAssert(app.staticTexts["Created At"].exists)
        XCTAssert(app.staticTexts["2020-10-05T10:32:50.077Z"].exists)
        XCTAssert(app.staticTexts["Status"].exists)
        XCTAssert(app.staticTexts["vacate"].exists)
        XCTAssert(app.buttons["Book Now"].exists)
    }
    
    func testBookingButton() {
        let app = XCUIApplication()
        app.launch()
        
        // select the first cell in meeting rooms
        app.tables["meetingRoomListTable"].cells.firstMatch.tap()
        let bookNow = app.buttons["Book Now"]
        XCTAssert(bookNow.exists)
        XCTAssertTrue(bookNow.isEnabled)
        XCTAssertTrue(bookNow.isHittable)
        
        // click bookNow button
        bookNow.tap()
        let alert = app.alerts["Moonside"]
        XCTAssertTrue(alert.waitForExistence(timeout: 5), "Failed to show alert")
        
        //verify the alert behaviour
        let alertBookButton = alert.buttons["Book"]
        XCTAssertTrue(alertBookButton.waitForExistence(timeout: 5), "Book button does not exist")
        
        let alertCancelButton = alert.buttons["Cancel"]
        XCTAssertTrue(alertCancelButton.waitForExistence(timeout: 5), "Cancel button does not exist")
        alertCancelButton.tap()
        
        XCTAssertFalse(alert.exists)
        bookNow.tap()
        alertBookButton.tap()
        XCTAssertTrue(app.staticTexts["occupied"].waitForExistence(timeout: 5), "status not updated")
    }
}
