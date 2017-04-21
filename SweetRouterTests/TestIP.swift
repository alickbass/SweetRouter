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
        XCTAssertEqual(IP(127, 0, 0, 1).hashValue, IP(127, 0, 0, 1).hashValue)
        XCTAssertNotEqual(IP(127, 0, 127, 1).hashValue, IP(0, 1, 0, 2).hashValue)
        XCTAssertNotEqual(IP(127, 24, 127, 25).hashValue, IP(12, 24, 12, 25).hashValue)
    }
    
    func testIPStringInit() {
        XCTAssertEqual(IP("127.24.127.25"), IP(127, 24, 127, 25))
        XCTAssertEqual(IP("0.0.0.0"), IP(0, 0, 0, 0))
        XCTAssertEqual(IP("255.255.255.255"), IP(255, 255, 255, 255))
        XCTAssertNil(IP("255.255.256.255"))
        XCTAssertNil(IP("128.0.256"))
        XCTAssertNil(IP("randomString"))
    }
    
    func testIPv6Hashable() {
        XCTAssertEqual(IP.V6(0x2001,0xcdba,0x0000,0x0000,0x0000,0x0000,0x3257,0x9652), IP.V6(0x2001,0xCDBA,0,0,0,0,0x3257,0x9652))
        XCTAssertEqual(IP.V6(0x2001,0xcdba,0x0,0x0,0x0,0x0,0x3257,0x9652).hashValue, IP.V6(0x2001,0xcdba,0x0,0x0,0x0,0x0,0x3257,0x9652).hashValue)
        XCTAssertNotEqual(IP.V6(0x2001,0xcdba,0,0,0,0,0x3257,0x9652).hashValue, IP.V6(0x2001,0xcdba,0x0,0x3257,0x0,0x3257,0x3257,0x9652).hashValue)
    }
    
}
