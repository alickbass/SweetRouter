//
//  TestEnvironment.swift
//  SweetRouter
//
//  Created by Oleksii on 17/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import XCTest
import SweetRouter

class TestEnvironment: XCTestCase {
    
    func testEnvironmentEquatable() {
        typealias Environment = URL.Environment
        XCTAssertEqual(Environment(IP(127, 0, 0, 1), 8080), Environment(.http, "127.0.0.1", 8080))
        XCTAssertEqual(Environment.localhost(4001), Environment(.http, "localhost", 4001))
    }
    
}
