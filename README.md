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
    
    let environment: Environment
    let route: Route
    
    init(_ environment: Environment = .localhost, at route: Route) {
        self.environment = environment
        self.route = route
    }
}
```

And in our application we would use it like this:

```swift
print(Api(at: .me).url) // prints http://localhost:8080/me
print(Api(.test, at: .auth).url) // prints http://126.251.20.32/auth
print(Api(.production, at: .posts(for: Date()))) // prints https://myproductionserver.com:3000/posts?date=12.04.2017&userId=someId
```
