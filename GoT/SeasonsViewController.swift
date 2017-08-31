//
//  SeasonsViewController.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 29/8/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import UIKit

class SeasonsViewController: UITableViewController {
        
    let model : [Season]
    
    
    
    init(model : [Season]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "SeasonCell"
        // Season que queremos mostrar
        let season = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: cellID)
        }
        
        // Sincronizar Season -> Cell
        cell?.textLabel?.text = season.name
        cell?.detailTextLabel?.text = season.premiereDate.shortDateString()
    
        
        return cell!

    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar season
        let season: Season = model[indexPath.row]
        
        // Mostrar episodios
        let seasonVC = EpisodesViewController(model: season.sortedEpisodes())
        navigationController?.pushViewController(seasonVC, animated: true)
    }


    
}
