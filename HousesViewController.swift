//
//  HousesViewController.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 23/7/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import UIKit

class HousesViewController: UITableViewController {
        
    let model : [House]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    init(model : [House]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    override func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Descubrir cual es la casa que queremos mostrar
        let house = model[indexPath.row]
        // Crear una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        cell.houseImage.image = house.sigil.image
        cell.houseNameLabel.text = house.name
        
        return cell
        
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar casa
        let house = model[indexPath.row]
        
        // Mostrar casa
        let houseVC = HouseViewController(model: house)
        navigationController?.pushViewController(houseVC, animated: true)
    }
    
}
