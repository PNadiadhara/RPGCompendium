//
//  CharacterSpellsControllerViewController.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/4/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class CharacterSpellsControllerViewController: UIViewController {
    @IBOutlet var characterSpellSearchBar: UISearchBar!
    @IBOutlet var characterSpellTableView: UITableView!
    
    @IBOutlet var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSettings()
    }
    
    private func configureSettings() {
       backgroundImage.image = UIImage(named: "cave_bg")
        
    }
   
    @IBAction func spellSlotIndicatorButton(_ sender: UIButton) {
        print("Button Pressed")
      // TOGGLES SPELL SLOT INDICATORS
        if sender.image(for: .normal) == UIImage(named: "clearButton") {
            sender.setImage(UIImage(named: "purple"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "clearButton"), for: .normal)
        }
        

    }
    
}
