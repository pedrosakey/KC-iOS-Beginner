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

## First Controller and AppDelegate

### Comparable

```
extension House{
      
    var proxyForComparison : String{
        get{
            return name //aqui antes de comparar creas una representacion normalizada
            // pasar a mayusculas, etc.
        }
    }
}

//MARK: - Comparable
extension House : Comparable{
    //menor compilador
    //mayor o igual - menor o igual equatable
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

```

### Typealias

```
typealias Words = String
typealias Members = Set<Person>
```

- Create UIViewcontroller + .xib 
Define model

- syncviewwithmodel when controller appears

- AppDelegate - didFinishLaunchingWithOptions

```
 // Creamos un modelo
        let starkSigil = Sigil(image:  imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Code is coming!")
        
        // Creamos el controlador
        let starkVC = HouseViewController(model: starkHouse)
        
        // Asignamos el RootVC
        window?.rootViewController = starkVC

```

![Create Model AppDelegate to UIViewController](https://drive.google.com/uc?id=11ffiV-T27X3mvWahRtN8WR2vrNA6i7iO)


## Tab bar Controller with 2 UINavigationController

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Crear window
 	 ...        
        // Creamos unos modelos
 	 ...        
        // Creamos los controladores
        let starkVC = HouseViewController(model: starkHouse)
        let lannisterVC = HouseViewController(model: lannisterHouse)
        
        // Creamos los Navigations
        let starkNav = UINavigationController(rootViewController: starkVC)
        let lannisterNav = UINavigationController(rootViewController: lannisterVC)
        
        // Creamos el TabBar
        let tabVC = UITabBarController()
        tabVC.viewControllers = [lannisterNav, starkNav]
        
        // Asignamos el RootVC
        window?.rootViewController = tabVC
        
        return true
    }

```

## Wrapper UIViewController in NavigationController


```
import UIKit

extension UIViewController{
    
    func wrappedInNavigation() -> UINavigationController{
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
    
}

```
Ejemplo de uso
```
// Creamos el TabBar
        let tabVC = UITabBarController()
        tabVC.viewControllers = [lannisterVC.wrappedInNavigation(), starkVC.wrappedInNavigation()]

```

## Repository


```
import Foundation

final class Repository{
    
    static let local = LocalFactory()
}

protocol HouseFactory {
    
    var houses : [House] {get}
}

final class LocalFactory : HouseFactory {
    var houses: [House]{
        get {
            //Aqui es donde creas casas
          ...
                
            // Añadir los personajes a las casas
          ...
      
            return [stark, lannister].sorted()
        }
    }
    
}

```

_Example of use_

**AppDelegate: didFinishLaunchingWithOptions**

```
// Creamos unos modelos
        let houses = Repository.local.houses
        
        // Creamos los controladores
        var controllers = [HouseViewController]()
        for house in houses{
            controllers.append(HouseViewController(model: house))
        }
        
        // Creamos los navigation controllers
        var navs = [UINavigationController]()
        for controller in controllers{
            navs.append(UINavigationController(rootViewController: controller))
        }

        // Creamos el TabBar
        let tabVC = UITabBarController()
        tabVC.viewControllers = navs

```        
##  Repositorio  using UIKIT Extensión

##  Refactoring with MAP

```
// Creamos el TabBar
        let tabVC = UITabBarController()
        tabVC.viewControllers = houses.map {HouseViewController(model: $0).wrappedInNavigation()}

```

> Now the app return House that can came from networks u other sources

## Improve Repository

import Foundation

final class Repository{
    
    static let local = LocalFactory()
}

```
protocol HouseFactory {
    
    typealias Filter = (House)->Bool
    
    var houses : [House] {get}
    func house(named: String)->House?
    func houses(filteredBy: Filter) -> [House]
    
  }

final class LocalFactory : HouseFactory {
    
    func houses(filteredBy: Filter) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }

    var houses: [House]{
        get {
            //Aqui es donde creas casas
	...
                 // Refactorizamos para que se añadan automaticamenente
            // Añadir los personajes a las casas
                       return [stark, lannister, targaryen].sorted()
	...
        }
    }
    
}

extension HouseFactory {
    
    func house(named : String) -> House? {
        var house : House?
        house = houses.filter({$0.name == named}).first
          return house
}

```


# ToDo
