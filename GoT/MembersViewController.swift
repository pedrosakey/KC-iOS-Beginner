//
//  PersonsViewController.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 23/7/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import UIKit

class MembersViewController: UITableViewController {
        
    let model : [Person]
    
    init(model: [Person]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
              return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Id de celda
        let cellID = "PersonCell"
        
        //Persona que queremos mostrar
        let person = model[indexPath.row]
        
        //Crear la celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style:.default, reuseIdentifier: cellID)
        }
        
        //Sincronizar Person -> Cell
        cell?.textLabel?.text = person.fullName
        
        return cell!
    }

    
}
