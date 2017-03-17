//
//  Router.swift
//  SweetRouter
//
//  Created by Oleksii on 17/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import Foundation

public protocol RouterType {
    associatedtype Environment: EnvironmentType
    associatedtype Route: RouteType
    
    var environment: Environment { get }
    var route: Route { get }
    var components: URLComponents { get }
    var url: URL { get }
}

public protocol RouteType {
    var route: URL.Route { get }
    var defaultPath: URL.Path { get }
}

public protocol EnvironmentType {
    var value: URL.Environment { get }
}

public extension RouterType {
    var components: URLComponents {
        var components = URLComponents()
        let environment = self.environment.value
        let route = self.route
        
        components.scheme = environment.scheme.rawValue
        components.host = environment.host.hostString
        components.port = environment.port
        components.path = route.defaultPath.with(route.route.path).pathValue
        components.queryItems = route.route.query?.queryItems
        
        return components
    }
    
    var url: URL {
        guard let url = components.url else { fatalError("URL components are not valid") }
        return url
    }
}

public extension RouteType {
    public var defaultPath: URL.Path { return [] }
}
