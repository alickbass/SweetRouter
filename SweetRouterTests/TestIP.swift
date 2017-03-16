//
//  TestIP.swift
//  SweetRouter
//
//  Created by Oleksii on 16/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import XCTest
import SweetRouter

class TestIP: XCTestCase {
    
    func testIPHashable() {
        XCTAssertEqual(IP(127, 0, 0, 1), IP(127, 0, 0, 1))
        XCTAssertEqual(IP(127, 0, 0, 1).stringValue, "127.0.0.1")
        XCTAssertEqual(IP(127, 0, 0, 1).hashValue, IP(127, 0, 0, 1).hashValue)
        XCTAssertNotEqual(IP(127, 0, 127, 1).hashValue, IP(0, 1, 0, 2).hashValue)
    }
    
}
