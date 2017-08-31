//
//  Episode.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 24/8/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import Foundation

final class Episode {
    let title : String
    let emissionDate : Date
    weak var seasonEpisode : Season!
    
    init(title: String, emmisionDate: Date){
        (self.title, self.emissionDate) = (title, emmisionDate)
    }
    
}

extension Episode{
    var fullDescription : String{
        return "\(title) \(seasonEpisode.name)"
    }
    
    func addSeason(_ season: Season){
        self.seasonEpisode = season
    }
}

// MARK : -  Proxies
extension Episode{
    
    var _proxyForEquality : String{
        get{
            return "\(title) \(emissionDate)"
        }
    }
    
    private var _proxyForComparison : String{
        return emissionDate.description
    }
    
    private var _proxyForHash : Int{
        return _proxyForComparison.hash
    }
}


// MARK : -  Protocols
extension Episode : CustomStringConvertible{
    var description: String {
        return "<\(type(of: self)): \(fullDescription)>"
    }
    
    
}

extension Episode : Equatable{
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return (lhs._proxyForEquality == rhs._proxyForEquality)
    }
    
    
}

extension Episode : Hashable{
    var hashValue: Int {
        return _proxyForHash
    }
}

//MARK: - Comparable
extension Episode : Comparable{
    //menor compilador
    //mayor o igual - menor o igual equatable
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs._proxyForComparison < rhs._proxyForComparison
}
}

