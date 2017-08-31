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
    
    typealias FilterHouse = (House)->Bool
    
    var houses : [House] {get}
    func house(named: String)->House?
    func houses(filteredBy: FilterHouse) -> [House]
    
  }

protocol SeasonFactory {

    var  seasons : [Season] {get}
    func season(named: String)->Season?
    
}


final class LocalFactory : HouseFactory, SeasonFactory{
    
    func houses(filteredBy: FilterHouse) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }

    var houses: [House]{
        get {
            //Create house
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image:#imageLiteral(resourceName: "Casa_Targaryen_estandarte.png"), description: "Fire and blood")
            
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            
            
            
            
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
            
            // Refactorizar para que se añadan automaticamenente
            
            stark.add(persons: robb, arya)
            lannister.add(persons: tyrion, cersei, jaime, tywin)
            targaryen.add(persons: khaleesi, viserys)
            
            return [stark, lannister, targaryen].sorted()
        }
    }
    
    
    var seasons: [Season] {
        get {
            //Create Seasons
            
            //Season1
            
                //Season1 - Episodes
                let s1e1 = Episode(title: "Winter Is Coming", emmisionDate: Date.createDate(day: 17, month: 4, year: 2011))
                let s1e2 = Episode(title: "The kingsroad", emmisionDate: Date.createDate(day: 24, month: 4, year: 2011))
                //Season1 - Create & Add Episodes
                let s1 = Season(name: "Season 1", episodes: [s1e1,s1e2], premiereDate: Date.createDate(day: 17, month: 4, year: 2011))
            
            //Season2
            
                //Season2 - Episodes
                let s2e1 = Episode(title: "The North Remembers", emmisionDate: Date.createDate(day: 1, month: 4, year: 2012))
                let s2e2 = Episode(title: "The Night Lands", emmisionDate: Date.createDate(day: 8, month: 4, year: 2012))
                //Season2 - Create & Add Episodes
                let s2 = Season(name: "Season 2", episodes: [s2e1,s2e2], premiereDate: Date.createDate(day: 5, month: 7, year: 2012))
            
            //Season3
            
                //Season3 - Episodes
                let s3e1 = Episode(title: "Valar Dohaeris", emmisionDate: Date.createDate(day: 31, month: 3, year: 2013))
                let s3e2 = Episode(title: "Dark Wings, Dark Words", emmisionDate: Date.createDate(day: 7, month: 4, year: 2013))
                //Season1 - Create & Add Episodes
                let s3 = Season(name: "Season 3", episodes: [s3e1,s3e2], premiereDate: Date.createDate(day: 31, month: 3, year: 2013))
            
            //Season4
            
                //Season4 - Episodes
                let s4e1 = Episode(title: "Two Swords", emmisionDate: Date.createDate(day: 6, month: 4, year: 2014))
                let s4e2 = Episode(title: "The Lion and the Rose", emmisionDate: Date.createDate(day: 13, month: 4, year: 2014))
                //Season1 - Create & Add Episodes
                let s4 = Season(name: "Season 4", episodes: [s4e1,s4e2], premiereDate: Date.createDate(day: 6, month: 4, year: 2014))
            
            //Season5
            
                //Season5 - Episodes
                let s5e1 = Episode(title: "The wars to come", emmisionDate: Date.createDate(day: 12, month: 4, year: 2015))
                let s5e2 = Episode(title: "The House of Black and White", emmisionDate: Date.createDate(day: 19, month: 4, year: 2015))
                //Season1 - Create & Add Episodes
                let s5 = Season(name: "Season 5", episodes: [s5e1,s5e2], premiereDate: Date.createDate(day: 12, month: 4, year: 2015))
            
            //Season6
            
                //Season6 - Episodes
                let s6e1 = Episode(title: "The red Woman", emmisionDate: Date.createDate(day: 24, month: 4, year: 2016))
                let s6e2 = Episode(title: "Home", emmisionDate: Date.createDate(day: 1, month: 5, year: 2016))
                //Season1 - Create & Add Episodes
                let s6 = Season(name: "Season 6", episodes: [s6e1,s6e2], premiereDate: Date.createDate(day: 24, month: 4, year: 2016))
                
            
            // Return Seasons
            return [s1, s2, s3, s4, s5, s6].sorted()
            
        }
    }
    
}

extension HouseFactory {
    
    func house(named : String) -> House? {
        var house : House?
        house = houses.filter({$0.name == named}).first
        return house
    }
    
}

extension SeasonFactory {
    
    func season(named: String) -> Season? {
        var season : Season?
        season = seasons.filter({$0.name == named}).first
        return season
    }
}
