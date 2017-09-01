//
//  HouseViewController.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 14/7/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
    @IBOutlet weak var wordsTextView: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
   
    let model : House
    
    init (model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = model.name
    }
    
    // Chapuza de los de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        //Botones
        //Creamos un botón a la barra del navigation controller
        let wiki = UIBarButtonItem(title: "Wiki",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
        
        //Creamos un botón a la barra del navigation controller
        let members = UIBarButtonItem(title: "Members",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayMembers))
        
        //Añadimos
        navigationItem.rightBarButtonItems = [wiki, members]
        
    }

    @objc func displayWiki(){
        
        // Creams un wikiVC
        let wikiVC = WikiViewController(model: model)
        
        // Lo cargamos en el navigation
        navigationController?.pushViewController(wikiVC,
                                                 animated: true)
        
    }
    
    @objc func displayMembers(){
        //personsVC
        let dataSource = DataSources.personsDataSource(model:model.sortedMembers())
        let membersVC = ArrayTableViewController(dataSource: dataSource, title: "Members", style: .plain)
        
        // Lo cargamos en el navigation
        navigationController?.pushViewController(membersVC, animated: true)
        
    }
    
    func syncViewWithModel(){
        // model --> View
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsTextView.text = model.words
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        syncViewWithModel()
    }
}
