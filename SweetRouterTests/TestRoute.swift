//
//  TestRoute.swift
//  SweetRouter
//
//  Created by Oleksii on 17/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import XCTest
import SweetRouter

class TestRoute: XCTestCase {
    
    func testUrlRouteEquatable() {
        XCTAssertEqual(URL.Route(path: ["myPath"], query: ("user", nil), ("date", "12.04.02")), URL.Route(path: ["myPath"], query: ("user", "some"), ("date", "12.04.02")))
        XCTAssertNotEqual(URL.Route(path: ["myPath"]), URL.Route(path: ["myPath"], query: ("user", nil)))
    }
    
}
