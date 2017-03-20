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
    typealias Environment = URL.Environment
    
    func testEnvironmentEquatable() {
        XCTAssertEqual(Environment(IP(127, 0, 0, 1), 8080), Environment(.http, "127.0.0.1", 8080))
        XCTAssertEqual(Environment.localhost(4001), Environment(.http, "localhost", 4001))
    }
    
    func testEnvironmentURLConvertable() {
        XCTAssertEqual(Environment(IP(127, 0, 0, 1), 8080).url, URL(string: "http://127.0.0.1:8080"))
        XCTAssertEqual(Environment.localhost(4001).url, URL(string: "http://localhost:4001"))
    }
}
