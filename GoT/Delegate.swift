//
//  BaseViewControllerDelegate.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 1/9/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import UIKit

class BaseViewControllerDelegate<Element>: NSObject {
    var source : ArrayDataSource<Element>?
    var viewController : UIViewController?
}

final class GreatHousesDelegate: BaseViewControllerDelegate<House>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let house = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            let vc = HouseViewController(model: house)
            nav.pushViewController(vc, animated: true)
        }
    }
}

final class SeasonsDelegate: BaseViewControllerDelegate<Season>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
       // Saber la season
        if let season = source?.element(atIndexPath: indexPath),
             let nav = viewController?.navigationController{
            
            //Datasource
            let episodesDataSource = DataSources.episodeDataSource(model: season.sortedEpisodes())
            
            // VC
            let episodesVC = ArrayTableViewController(dataSource: episodesDataSource, title: "Episodes", style: .plain, delegate: EpisodesDelegate())

            nav.pushViewController(episodesVC, animated: true)
        }
        
      
    }
}



final class EpisodesDelegate: BaseViewControllerDelegate<Episode>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let episode = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            let vc = EpisodeViewController(model: episode)
            nav.pushViewController(vc, animated: true)
        }
    }
}





