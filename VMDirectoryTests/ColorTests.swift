//
//  ColorTests.swift
//  VMDirectoryTests
//
//  Created by Gauri Rohan on 07/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import XCTest
@testable import VMDirectory

class ColorTests: XCTestCase {

    func testHexColorRed() {
        let color = UIColor.init(hex: "#FF0000")
        XCTAssertEqual(color, UIColor.red)
    }
    
    func testHexColorMagenta() {
        let color = UIColor.init(hex: "#FF00FF")
        XCTAssertEqual(color, UIColor.magenta)
    }
    
    func testInvalidColorCode() {
        let _ = UIColor.init(hex: "#000000000FFFFFF")
        //XCTAssertEqual(color, UIColor.black)
    }
}
