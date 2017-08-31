//
//  EpisodesViewController.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 29/8/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import UIKit

class EpisodesViewController: UITableViewController {
    
    let model : [Episode]
        
    init(model: [Episode]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Episodes"
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
        //Id de celda
        let cellID = "EpisodeCell"
        
        //Episodio que queremos mostrar
        let episode = model[indexPath.row]
        
        //Crear la celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style:.value1, reuseIdentifier: cellID)
        }
        
        //Sincronizar Person -> Cell
        cell?.textLabel?.text = episode.title
        cell?.detailTextLabel?.text = episode.emissionDate.shortDateString()
        return cell!
    }
    
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar episode
        let episode: Episode = model[indexPath.row]
        
        // Mostrar episodios
        let episodeVC = EpisodeViewController(model: episode )
        navigationController?.pushViewController(episodeVC, animated: true)
    }
}
