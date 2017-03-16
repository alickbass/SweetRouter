//
//  TestRoutePath.swift
//  SweetRouter
//
//  Created by Oleksii on 16/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import XCTest
import SweetRouter

class TestRoutePath: XCTestCase {
    
    func testRouterPathEquatable() {
        XCTAssertNotEqual(RoutePath("new", "api", "cards"), RoutePath("new", "api"))
        XCTAssertEqual(RoutePath("new", "api", "cards"), RoutePath("new", "api", "cards"))
    }
    
    func testRouterPathArrayCreation() {
        let path = "/new/api/cards"
        
        XCTAssertEqual(RoutePath("new", "api", "cards").pathValue, path)
        XCTAssertEqual(RoutePath(RoutePath("new", "api"), "cards").pathValue, path)
        XCTAssertEqual((RoutePath("new", "api") + ["cards"]).pathValue, path)
        XCTAssertEqual(RoutePath("new", "api").with("cards").pathValue, path)
    }
    
}
