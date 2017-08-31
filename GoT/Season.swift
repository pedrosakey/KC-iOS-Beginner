//
//  Season.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 24/8/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import UIKit

typealias Episodes = Set<Episode>


//MARK: - Classes

final class Season {
    
    let name : String
    let premiereDate : Date
    //let episodes : [Episode]
    
    private var _episodes : Episodes
   
    
    init(name: String, episodes: [Episode], premiereDate: Date){
        (self.name, self.premiereDate) = (name, premiereDate)
        _episodes = Episodes()
        for episode in episodes {
            episode.addSeason(self)
            _episodes.insert(episode)
        }
    }
    
}

//MARK: - Extension

extension Season{
    var count : Int{
        return _episodes.count
    }
    
    func add(episode: Episode){
        guard episode.seasonEpisode.name == self.name else{
            return
        }
        _episodes.insert(episode)
    }
    
    
    // Sorted [Episode]
    func sortedEpisodes() -> [Episode] {
        return _episodes.sorted()
    }
}

extension Season{
    var proxyForEquality : String{
        get{
            return "\(name) \(premiereDate)"
        }
    }
    
    var proxyForComparison : String{
        get{
            return premiereDate.description
        }
    }

}

//MARK: - Equatable
extension Season : Equatable{
    static func == (lhs: Season, rhs: Season) -> Bool{
        
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

//MARK: - Hashable
extension Season : Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

//MARK: - Comparable
extension Season : Comparable{
    //menor compilador
    //mayor o igual - menor o igual equatable
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    
    
}


























