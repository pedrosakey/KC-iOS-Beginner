//
//  DataSources.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 1/9/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import UIKit

final class DataSources{
    
    static func housesDataSource(model: [House]) -> ArrayDataSource<House>{
        
        return ArrayDataSource(model: model) { (house:House, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "House"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            return cell!
        }
        
    }
    
    static func personsDataSource(model: [Person]) -> ArrayDataSource<Person>{
        
        return ArrayDataSource(model: model) { (person:Person, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "Person"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = person.fullName
            return cell!
        }
        
    }
    
    static func seasonsDataSource(model: [Season]) -> ArrayDataSource<Season>{
        
        return ArrayDataSource(model: model) { (season:Season, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "Season"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            cell?.textLabel?.text = season.name
            cell?.detailTextLabel?.text = season.premiereDate.shortDateString()

            return cell!
        }
        
    }
    
    static func episodeDataSource(model: [Episode]) -> ArrayDataSource<Episode>{
        
        return ArrayDataSource(model: model) { (episode:Episode, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "Episode"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            cell?.textLabel?.text = episode.title
            cell?.detailTextLabel?.text = episode.emissionDate.shortDateString()
            
            return cell!
        }
        
    }


}
