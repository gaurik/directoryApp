//
//  EmployeeViewModelTests.swift
//  VMDirectoryTests
//
//  Created by Gauri Rohan on 07/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import XCTest
@testable import VMDirectory

class EmployeeViewModelTests: XCTestCase {

    var employeeViewModel = EmployeesViewModel()
    
    func testFetchEmployeeData() {
        let expect = expectation(description: "details fetched")
        employeeViewModel.fetchEmployeeDetails {
            XCTAssertEqual(self.employeeViewModel.employeeList?.count, 100)
            expect.fulfill()
        }
         waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testVerifyEmployeeData() {
        let expect = expectation(description: "details fetched")
        employeeViewModel.fetchEmployeeDetails {
            let employeeObj = self.employeeViewModel.employeeList?[0]
            XCTAssertEqual(employeeObj?.firstName, "Kade")
            XCTAssertEqual(employeeObj?.lastName, "Senger")
            //XCTAssertEqual(employeeObj?.employeeId, "XXX1")
            XCTAssertEqual(employeeObj?.createdAt, "2020-10-05T11:17:20.779Z")
            XCTAssertEqual(employeeObj?.jobTitle, "Internal Applications Designer")
            XCTAssertEqual(employeeObj?.latitude, "47.8721")
            XCTAssertEqual(employeeObj?.longitude, "-137.9852")
            XCTAssertEqual(employeeObj?.phone, "(918) 592-3724")
            XCTAssertEqual(employeeObj?.favouriteColor, "#062118")
            XCTAssertEqual(employeeObj?.avatar, "https://s3.amazonaws.com/uifaces/faces/twitter/SULiik/128.jpg")
            XCTAssertEqual(employeeObj?.email, "Louisa_Skiles@hotmail.com")
            expect.fulfill()
        }
         waitForExpectations(timeout: 5.0, handler: nil)
    }
}
