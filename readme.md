# GoT. The  App

![version](https://img.shields.io/badge/swift-iOS-purple.svg?maxAge=2592000)

Fundamentals iOS. This is part of Mobile Development  BootCamp by [keepCoding](https://keepcoding.io). Educational purpose.


# Code Review

## Create models

### Class example

```
final class Person{
    let name    : String
    let house   : House
    private let _alias   : String?
    
    var alias : String{
        get{
            return _alias ?? ""
        }
    }
    
    init(name: String, alias: String?, house: House){
        
        self.name = name
        _alias = alias
        self.house = house
    }
    
    convenience init(name: String, house: House){
        self.init(name: name, alias: nil, house: house)
    }
    
}
```

- Example of init

- Convenience init

## Example of Hashable and Equatable

```
extension Person {
    var proxy: String {
        return "\(name) \(alias) \(house.name)"
    }
}

extension Person : Hashable{
    var hashValue: Int {
        get{
            return proxy.hashValue
        }
    }
}

extension Person : Equatable{
    static func ==(lhs: Person, rhs: Person) -> Bool{
        return lhs.proxy == rhs.proxy
    }
}

```

## AppDelegate: didFinishLaunchingWithOptions

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Create window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.cyan
        
        
        // Crear RootVC
        let rootVC = UIViewController()
        window?.rootViewController = rootVC
        
        return true
    }

```



# ToDo
