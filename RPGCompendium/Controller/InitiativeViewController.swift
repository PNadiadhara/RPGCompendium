//
//  ViewController.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 2/7/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class InitiativeViewController: UIViewController {
    
    //private var spells = Spell()

    @IBOutlet var backgroundImage: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSettings()
    }
    
    private func configureSettings() {
        backgroundImage.image = UIImage(named: "cave_bg")
        navigationController?.navigationBar.barTintColor = .black
    }



}

