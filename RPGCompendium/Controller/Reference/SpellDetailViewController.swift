//
//  SpellDetailViewController.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class SpellDetailViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var descTextView: UITextView!
    
    public var passedSpell : SpellResults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "cave_bg")
        // Do any additional setup after loading the view.
        descTextView.text = passedSpell.desc
        setUpPage()
        
    }
    
    func setUpPage() {
        title = passedSpell.name
    }

    

}
