//
//  TestRoute.swift
//  SweetRouter
//
//  Created by Oleksii on 17/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import XCTest
@testable import SweetRouter

class TestRoute: XCTestCase {
    
    func testUrlRouteEquatable() {
        XCTAssertEqual(URL.Route(path: ["myPath"], query: ("user", nil), ("date", "12.04.02")), URL.Route(path: ["myPath"], query: ("user", nil), ("date", "12.04.02")))
        XCTAssertNotEqual(URL.Route(path: ["myPath"]), URL.Route(path: ["myPath"], query: ("user", nil)))
    }
    
    func testUrlRouteQuery() {
        XCTAssertEqual(URL.Route(path: ["myPath"]).query(("user", nil), ("date", "12.04.02")), URL.Route(path: ["myPath"], query: URL.Query(("user", nil), ("date", "12.04.02")), fragment: nil))
        XCTAssertEqual(URL.Route(path: ["myPath"]).fragment("fragment"), URL.Route(path: ["myPath"], query: nil, fragment: "fragment"))
    }
    
}
