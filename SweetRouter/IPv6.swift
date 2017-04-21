//
//  IPv6.swift
//  SweetRouter
//
//  Created by Oleksii on 21/04/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import Foundation

extension IP {
    public struct V6 {
        public let quartets: (UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16)
        
        public init(_ one: UInt16, _ two: UInt16, _ three: UInt16, _ four: UInt16, _ five: UInt16, _ six: UInt16, _ seven: UInt16, _ eight: UInt16) {
            quartets = (one, two, three, four, five, six, seven, eight)
        }
    }
}

extension IP.V6: Hashable {
    public static func == (lhs: IP.V6, rhs: IP.V6) -> Bool {
        return lhs.quartets.0 == rhs.quartets.0
            && lhs.quartets.1 == rhs.quartets.1
            && lhs.quartets.2 == rhs.quartets.2
            && lhs.quartets.3 == rhs.quartets.3
            && lhs.quartets.4 == rhs.quartets.4
            && lhs.quartets.5 == rhs.quartets.5
            && lhs.quartets.6 == rhs.quartets.6
            && lhs.quartets.7 == rhs.quartets.7
    }
    
    public var hashValue: Int {
        var hash = 5381
        func newHash(with value: UInt16) {
            hash = ((hash << 5) &+ hash) &+ value.hashValue
        }
        
        newHash(with: quartets.0)
        newHash(with: quartets.1)
        newHash(with: quartets.2)
        newHash(with: quartets.3)
        newHash(with: quartets.4)
        newHash(with: quartets.5)
        newHash(with: quartets.6)
        newHash(with: quartets.7)
        
        return hash
    }
}
