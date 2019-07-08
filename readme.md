# GoT. The  App

![version](https://img.shields.io/badge/objectiveC-iOS-purple.svg?maxAge=2592000)

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


# ToDo
