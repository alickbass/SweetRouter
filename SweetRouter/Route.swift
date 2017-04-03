//
//  Route.swift
//  SweetRouter
//
//  Created by Oleksii on 16/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import Foundation

public extension URL {
    public struct Route {
        public let path: Path
        public let query: Query?
        public let fragment: String?
        
        public init(path: Path, query: (name: String, value: QueryItemValue?)...) {
            self.path = path
            self.query = Query(query)
            fragment = nil
        }
        
        init(path: Path, query: Query?, fragment: String?) {
            self.path = path
            self.query = query
            self.fragment = fragment
        }
        
        public init(path: Path) {
            self.init(path: path, query: nil, fragment: nil)
        }
        
        public func query(_ query: (name: String, value: QueryItemValue?)...) -> Route {
            return Route(path: path, query: Query(query), fragment: nil)
        }
        
        public func fragment(_ fragment: String) -> Route {
            return Route(path: path, query: query, fragment: fragment)
        }
    }
}

extension URL.Route: Equatable {
    public static func == (lhs: URL.Route, rhs: URL.Route) -> Bool {
        return lhs.path == rhs.path && lhs.query == rhs.query && lhs.fragment == rhs.fragment
    }
}
