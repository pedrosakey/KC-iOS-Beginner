//
//  EpisodeViewController.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 31/8/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
  
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var emissionDate: UILabel!
    @IBOutlet weak var seasonEpisode: UILabel!
    
    let model : Episode

    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel(){
        
        episodeTitle.text = "Title: \(model.title)"
        
        emissionDate.text = "Emission Date: \(model.emissionDate.shortDateString())"
        
        seasonEpisode.text = "Season: \(model.seasonEpisode.name)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
    }

}
