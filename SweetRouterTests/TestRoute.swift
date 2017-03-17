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
        XCTAssertEqual(Route(path: ["myPath"], query: ("user", nil)), Route(path: ["myPath"], query: ("user", nil)))
        XCTAssertNotEqual(Route(path: ["myPath"]), Route(path: ["myPath"], query: ("user", nil)))
    }
    
}
