//
//  Path.swift
//  SweetRouter
//
//  Created by Oleksii on 16/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import Foundation

public protocol RoutePathComponent {
    var stringValue: String { get }
    var pathValue: String { get }
}

public extension RoutePathComponent {
    public var pathValue: String {
        return Route.Path.separator + stringValue
    }
}

public extension Route {
    public struct Path {
        fileprivate static let separator = "/"
        fileprivate let path: [RoutePathComponent]
        
        public init(_ path: RoutePathComponent...) {
            self.init(path)
        }
        
        public init(_ path: [RoutePathComponent]) {
            self.path = path
        }
        
        public func with(_ path: RoutePathComponent...) -> Path {
            return Path(self.path + path)
        }
    }

}

extension Route.Path: RoutePathComponent {
    public var stringValue: String {
        return path.map({ $0.stringValue }).joined(separator: Route.Path.separator)
    }
}

extension Route.Path: Equatable {
    public static func == (lhs: Route.Path, rhs: Route.Path) -> Bool {
        return lhs.path.lazy.map({ $0.stringValue }) == rhs.path.lazy.map({ $0.stringValue })
    }
}

extension Route.Path: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: RoutePathComponent...) {
        self.init(elements)
    }
}

public extension Route.Path {
    public static func + (lhs: Route.Path, rhs: Route.Path) -> Route.Path {
        return Route.Path(lhs.path + rhs.path)
    }
}

extension String: RoutePathComponent {
    public var stringValue: String {
        return self
    }
}
