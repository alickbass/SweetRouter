//
//  Route.swift
//  SweetRouter
//
//  Created by Oleksii on 16/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import Foundation

public struct Route {
    public let path: RoutePath
    public let query: Query?
    
    public init(path: RoutePath, query: (name: String, value: QueryItemValue?)) {
        self.path = path
        self.query = Query(query)
    }
    
    public init(path: RoutePath) {
        self.path = path
        self.query = nil
    }
}

extension Route: Equatable {
    public static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.path == rhs.path && lhs.query == rhs.query
    }
}
