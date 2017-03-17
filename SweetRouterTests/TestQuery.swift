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
        XCTAssertNotEqual(Query(("userId", "123"), ("today", nil)), Query(("userId", "123")))
        XCTAssertNotEqual(Query(("userId", "123"), ("today", nil)), Query(("userId", "123"), ("tomorrow", nil)))
        XCTAssertNotEqual(Query(("userId", "123"), ("today", nil)), Query(("userId", "123"), ("today", "24")))
        XCTAssertEqual(Query(("userId", "123"), ("today", nil)), Query(("userId", "123"), ("today", nil)))
    }
    
    func testQueryCreation() {
        let query = Query(("userId", "123"), ("today", nil))
        let items: [URLQueryItem] = [.init(name: "userId", value: "123"), .init(name: "today", value: nil)]
        XCTAssertEqual(query.queryItems, items)
    }
    
}
