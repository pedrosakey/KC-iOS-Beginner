//
//  House.swift
//  Westeros
//
//  Created by Pedro Sánchez Castro on 6/7/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import UIKit


typealias Words = String
typealias Members = Set<Person>

// MARK: - Classes
final class House{
    
    let name  : String
    let sigil : Sigil
    let words : Words
    
    private var _members : Members
    
    init(name: String, sigil: Sigil, words: Words) {
        (self.name, self.sigil, self.words) = (name, sigil, words)
        _members = Members()
    }
    
}

final class Sigil{
    let description : String
    let image       : UIImage
    
    init(image : UIImage, description : String) {
        (self.image, self.description) = (image, description)
    }
}

extension House{
    var count : Int{
        return _members.count
    }
    
    func add(person: Person){
        
        guard person.house.name == self.name else {
            return
        }
        _members.insert(person)
    }
}

extension House{
    var proxyForEquality : String{
        get{
            return "\(name) \(words) \(count)"
        }
    }
    
    var proxyForComparison : String{
        get{
            return name //aqui antes de comparar creas una representacion normalizada
            // pasar a mayusculas, etc.
        }
    }
}

//MARK: - Equatable
extension House : Equatable{
    static func == (lhs: House, rhs: House) -> Bool{
        
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

//MARK: - Hashable
extension House : Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue
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












