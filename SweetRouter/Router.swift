//
//  Router.swift
//  SweetRouter
//
//  Created by Oleksii on 17/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import Foundation

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

public protocol RouterType: URLRepresentable {
    associatedtype Environment: EnvironmentType
    associatedtype Route: RouteType
    
    var environment: Environment { get }
    var route: Route { get }
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

public extension RouterType {
    public var components: URLComponents {
        var components = environment.components
        
        components.path = route.defaultPath.with(route.route.path).pathValue
        components.queryItems = route.route.query?.queryItems
        
        return components
    }
}

public extension RouteType {
    public var defaultPath: URL.Path { return [] }
}
