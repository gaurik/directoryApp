//
//  EmployeeDetailTests.swift
//  VMDirectoryTests
//
//  Created by Gauri Rohan on 07/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import XCTest
@testable import VMDirectory

class EmployeeDetailViewModelTests: XCTestCase {
    
    let employeeDetailVM = EmployeeDetailViewModel()
    
    func testLocation1() {
        let expect = expectation(description: "Location found")
        employeeDetailVM.lookUpCurrentLocation(latitude: "52", longitude: "12") { (placemark) in
                                                XCTAssertEqual(placemark?.country, "Germany")
                                                expect.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testLocation2() {
        let expect = expectation(description: "Location found")
        employeeDetailVM.lookUpCurrentLocation(latitude: "40", longitude: "4") { (placemark) in
                                                XCTAssertEqual(placemark?.country, "Spain")
                                                expect.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testInvalidLocation1() {
        let expect = expectation(description: "Incorrect Location found")
        employeeDetailVM.lookUpCurrentLocation(latitude: "1", longitude: "1") { (placemark) in
                                                XCTAssertEqual(placemark?.country, nil)
                                                expect.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testInvalidLocation2() {
        let expect = expectation(description: "Incorrect Location found")
        employeeDetailVM.lookUpCurrentLocation(latitude: "abc", longitude: "xyz") { (placemark) in
                                                XCTAssertEqual(placemark?.country, nil)
                                                expect.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
