//
//  Router.swift
//  SweetRouter
//
//  Created by Oleksii on 17/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import Foundation

public struct Router<T: EndpointType>: URLRepresentable {
    public let environment: T.Environment
    public let route: T.Route
    
    public init(_ environment: T.Environment = T.default, at route: T.Route) {
        self.environment = environment
        self.route = route
    }
    
    public var components: URLComponents {
        var components = environment.components
        let route = self.route.route
        
        components.path = self.route.defaultPath.with(route.path).pathValue
        components.queryItems = route.query?.queryItems
        components.fragment = route.fragment
        
        return components
    }
}

public protocol URLRepresentable {
    var components: URLComponents { get }
    var url: URL { get }
}

public extension URLRepresentable {
    public var url: URL {
        guard let url = components.url else { fatalError("URL components are not valid") }
        return url
    }
}

public protocol EndpointType {
    associatedtype Environment: EnvironmentType
    associatedtype Route: RouteType
    
    static var `default`: Environment { get }
}

public protocol RouteType {
    var route: URL.Route { get }
    var defaultPath: URL.Path { get }
}

public protocol EnvironmentType: URLRepresentable {
    var value: URL.Environment { get }
}

public extension EnvironmentType {
    public var components: URLComponents {
        var components = URLComponents()
        let environment = value
        
        components.scheme = environment.scheme.rawValue
        components.host = environment.host.hostString
        components.port = environment.port
        
        return components
    }
}

public extension RouteType {
    public var defaultPath: URL.Path { return [] }
}
