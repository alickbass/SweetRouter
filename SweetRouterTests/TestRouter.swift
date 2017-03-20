//
//  TestRouter.swift
//  SweetRouter
//
//  Created by Oleksii on 17/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import XCTest
import SweetRouter

struct Api: RouterType {
    enum Environment: EnvironmentType {
        case localhost
        case test
        case production
        
        var value: URL.Environment {
            switch self {
            case .localhost: return .localhost(8080)
            case .test: return .init(IP(126, 251, 20, 32))
            case .production: return .init(.https, "myproductionserver.com", 3000)
            }
        }
    }
    
    enum Route: RouteType {
        case auth, me
        case posts(for: String)
        
        var route: URL.Route {
            switch self {
            case .me: return .init(path: ["me"])
            case .auth: return .init(path: ["auth"])
            case let .posts(for: date):
                return URL.Route(path: ["posts"], query: ("date", date), ("userId", "someId"))
            }
        }
    }
    
    static let `default`: Environment = .localhost
}

struct Auth: RouterType {
    enum Route: RouteType {
        case signIn, signOut
        
        var route: URL.Route {
            switch self {
            case .signIn: return .init(path: ["signIn"])
            case .signOut: return .init(path: ["signOut"])
            }
        }
            
        var defaultPath: URL.Path {
            return .init("api", "new")
        }
    }
    
    static let `default` = URL.Environment(.https, "auth.server.com", 8080)
}

class TestRouter: XCTestCase {
    
    func testApiRouter() {
        XCTAssertEqual(Router<Api>(at: .me).url, URL(string: "http://localhost:8080/me"))
        XCTAssertEqual(Router<Api>(.test, at: .auth).url, URL(string: "http://126.251.20.32/auth"))
        XCTAssertEqual(Router<Api>(.production, at: .posts(for: "12.04.2017")).url, URL(string: "https://myproductionserver.com:3000/posts?date=12.04.2017&userId=someId"))
    }
    
    func testAuthRouter() {
        XCTAssertEqual(Router<Auth>(at: .signIn).url, URL(string: "https://auth.server.com:8080/api/new/signIn"))
        XCTAssertEqual(Router<Auth>(at: .signOut).url, URL(string: "https://auth.server.com:8080/api/new/signOut"))
    }
    
}
