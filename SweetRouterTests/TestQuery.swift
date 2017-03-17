//
//  TestQuery.swift
//  SweetRouter
//
//  Created by Oleksii on 17/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import XCTest
import SweetRouter

class TestQuery: XCTestCase {
    
    func testQueryEquatable() {
        XCTAssertNotEqual(Route.Query(("userId", "123"), ("today", nil)), Route.Query(("userId", "123")))
        XCTAssertNotEqual(Route.Query(("userId", "123"), ("today", nil)), Route.Query(("userId", "123"), ("tomorrow", nil)))
        XCTAssertNotEqual(Route.Query(("userId", "123"), ("today", nil)), Route.Query(("userId", "123"), ("today", "24")))
        XCTAssertEqual(Route.Query(("userId", "123"), ("today", nil)), Route.Query(("userId", "123"), ("today", nil)))
    }
    
    func testQueryCreation() {
        let query = Route.Query(("userId", "123"), ("today", nil))
        let items: [URLQueryItem] = [.init(name: "userId", value: "123"), .init(name: "today", value: nil)]
        XCTAssertEqual(query.queryItems, items)
    }
    
}
