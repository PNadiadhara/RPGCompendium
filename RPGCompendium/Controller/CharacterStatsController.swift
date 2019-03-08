//
//  CharacterStatsController.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/4/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class CharacterStatsController: UIViewController {
    
    var endPointURLString = "https://api-beta.open5e.com/spells/"
    
    private var spells = [SpellResults](){
        didSet {
            DispatchQueue.main.async {
                print(self.spells.count)
            }
        }
    }
    
    @IBOutlet var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSettings()
        getSpells()
        
        
    }
    
    private func configureSettings() {
        backgroundImage.image = UIImage(named: "cave_bg")
        
    }
    
    func getSpells () {
        APIClient.getSpell(endPointURLString: endPointURLString) { (error, data) in
            if let error = error {
                print(error)
            } else if let data = data {
                self.spells += data.results
                self.endPointURLString = data.next ?? "null"
                if self.endPointURLString != "null" {
                    self.getSpells()
                }
            }
            
        }
    }
    
    
    
}
