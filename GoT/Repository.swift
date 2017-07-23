//
//  Repository.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 16/7/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import Foundation

final class Repository{
    
    static let local = LocalFactory()
}

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
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image:#imageLiteral(resourceName: "Casa_Targaryen_estandarte.png"), description: "Fire and blood")
            
            let starkURL = URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "http://awoiaf.westeros.org/index.php/House_Targaryen")!
            
            
            
            
            let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: starkURL)
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words:"Hear me roar!", url: lannisterURL)
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words:"Fire and blood", url: targaryenURL)
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let cersei = Person(name: "Cercei", house: lannister)
            let jaime = Person(name: "Jaime", alias: "The Kingslayer", house: lannister)
            let tywin = Person(name: "Tywin", alias: "The old Lion", house: lannister)
            let khaleesi = Person(name: "khaleesi", alias: "Mother of dragon", house: targaryen)
            let viserys = Person (name:"Viserys", alias:"The Beggar king", house: targaryen)
            
            // Refactorizamos para que se añadan automaticamenente
            // Añadir los personajes a las casas
            stark.add(persons: robb, arya)
            lannister.add(persons: tyrion, cersei, jaime, tywin)
            targaryen.add(persons: khaleesi, viserys)
            
            return [stark, lannister, targaryen].sorted()
        }
    }
    
}

extension HouseFactory {
    
    func house(named : String) -> House? {
        var house : House?
        house = houses.filter({$0.name == named}).first
          return house
    }
    
/*extension HouseFactory{
    func house(_ filterBy: filter) -> House? {
        house = house.filter({filter}).first
    })
    }*/
    
    
    
}
