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
        XCTAssertEqual(URL.Route(path: ["myPath"], query: ("user", nil)), URL.Route(path: ["myPath"], query: ("user", nil)))
        XCTAssertNotEqual(URL.Route(path: ["myPath"]), URL.Route(path: ["myPath"], query: ("user", nil)))
    }
    
}
