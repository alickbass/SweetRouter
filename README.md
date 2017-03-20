# SweetRouter
Declarative URL routing in swift

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) 
[![Build Status](https://travis-ci.org/alickbass/SweetRouter.svg?branch=master)](https://travis-ci.org/alickbass/SweetRouter)
[![codecov](https://codecov.io/gh/alickbass/SweetRouter/branch/master/graph/badge.svg)](https://codecov.io/gh/alickbass/SweetRouter)

## Example of usage

Here is an example of the Router for some back-end `API`:

```swift
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
        case posts(for: Date)
        
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
```

And in our application we would use it like this:

```swift
print(Router<Api>(at: .me).url) // http://localhost:8080/me
print(Router<Api>(.test, at: .auth).url) // http://126.251.20.32/auth
print(Router<Api>(.production, at: .posts(for: Date())).url) // https://myproductionserver.com:3000/posts?date=12.04.2017&userId=someId
```

## What if I have only one environment?

It can often happen, that you will be using some third-party `API` and you will have only access to Production environment. So in this case your Router will look something like this:

```swift
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
```

And use it like this:

```swift
print(Router<Auth>(at: .signIn).url) // https://auth.server.com:8080/api/new/signIn
print(Router<Auth>(at: .signOut).url) // https://auth.server.com:8080/api/new/signOut
```

## How to use with Alamofire?

Add the following code somewhere in your app:

```swift
import Alamofire
import SweetRouter

extension Router: URLConvertible {
    func asURL() throws -> URL {
        return url
    }
}
```

And then you can use the same Routers like this:

```swift
Alamofire.request(Router<Auth>(at: .signIn))
```

As easy as that 😉
