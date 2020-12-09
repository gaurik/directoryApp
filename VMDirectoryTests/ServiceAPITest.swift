//
//  ServiceAPITest.swift
//  VMDirectoryTests
//
//  Created by Gauri Rohan on 08/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import Foundation

import XCTest
@testable import VMDirectory

class ServiceAPITest: XCTestCase {
    let service = APIService()
    
    func testFetchLocalEmployeeData() {
        let expect = expectation(description: "fetching data")
        service.fetchEmployeeDetailLocally { (employees) in
            XCTAssertEqual(employees.count, 4)
            let employee = employees[0]
            XCTAssertEqual(employee.employeeId, "XXX1")
            XCTAssertEqual(employee.firstName, "Kade")
            XCTAssertEqual(employee.createdAt, "2020-10-05T11:17:20.779Z")
            XCTAssertEqual(employee.avatar, "https://s3.amazonaws.com/uifaces/faces/twitter/SULiik/128.jpg")
            XCTAssertEqual(employee.email, "Louisa_Skiles@hotmail.com")
            XCTAssertEqual(employee.lastName, "Senger")
            XCTAssertEqual(employee.jobTitle, "Internal Applications Designer")
            XCTAssertEqual(employee.latitude, "47.8721")
            XCTAssertEqual(employee.longitude, "-137.9852")
            XCTAssertEqual(employee.phone, "(918) 592-3724")
            XCTAssertEqual(employee.favouriteColor, "#062118")
            expect.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchLocalMeetingsData() {
        let expect = expectation(description: "fetching data")
        service.fetchMeetingRoomDetailLocally { (meetingRooms) in
            XCTAssertEqual(meetingRooms.count, 4)
            let meetingRoom = meetingRooms[0]
            XCTAssertEqual(meetingRoom.createdAt, "1/1/2020")
            XCTAssertEqual(meetingRoom.isOccupied, true)
            XCTAssertEqual(meetingRoom.meetingRoomID, "1")
            XCTAssertEqual(meetingRoom.meetingRoomName, "Room 1")
            expect.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
