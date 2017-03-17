//
//  Environment.swift
//  SweetRouter
//
//  Created by Oleksii on 17/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import Foundation

public extension URL {
    public struct Environment {
        public let scheme: Scheme
        public let host: HostType
        public let port: Int?
        
        public static func localhost(_ scheme: Scheme, _ port: Int? = nil) -> Environment {
            return Environment(scheme, "localhost", port)
        }
        
        public static func localhost(_ port: Int? = nil) -> Environment {
            return localhost(.http, port)
        }
        
        public init(_ scheme: Scheme, _ host: HostType, _ port: Int? = nil) {
            self.scheme = scheme
            self.host = host
            self.port = port
        }
        
        public init(_ host: HostType, _ port: Int? = nil) {
            self.init(.http, host, port)
        }
    }
}

extension URL.Environment: Equatable {
    public static func == (lhs: URL.Environment, rhs: URL.Environment) -> Bool {
        return lhs.scheme == rhs.scheme
            && lhs.host.hostString == rhs.host.hostString
            && lhs.port == rhs.port
    }
}

extension URL.Environment: EnvironmentType {
    public var value: URL.Environment {
        return self
    }
}
