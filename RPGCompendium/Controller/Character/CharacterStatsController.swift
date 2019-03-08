//
//  CharacterStatsController.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/4/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class CharacterStatsController: UIViewController {
    
    
    
    @IBOutlet var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSettings()
        
        
    }
    
    private func configureSettings() {
        backgroundImage.image = UIImage(named: "cave_bg")
        
    }
    
  
    
    
    
}
