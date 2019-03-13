//
//  CreateSpellViewController.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class CreateSpellViewController: UIViewController {

    
    @IBOutlet var createSpell: CreateSpell!
    
    var createdSpell : SpellResults!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func setUpSpellToAddToCollection () {
        createdSpell.name = createSpell.spellName.text ?? ""
        createdSpell.desc = createSpell.spellDescription.text ?? ""
        createdSpell.higher_level = createSpell.spellHigherDescription.text ?? ""
        createdSpell.page = createSpell.phbPage.text ?? ""
        createdSpell.range = createSpell.range.text ?? ""
        createdSpell.components = createSpell.components.text ?? ""
        createdSpell.material = createSpell.material.text ?? ""
        createdSpell.ritual = createSpell.ritual.text ?? ""
        createdSpell.duration = createSpell.duration.text ?? ""
        createdSpell.concentration = createSpell.concentration.text ?? ""
        createdSpell.casting_time = createSpell.castingTime.text ?? ""
        createdSpell.level = createSpell.level.text ?? ""
        createdSpell.school = createSpell.school.text ?? ""
        createdSpell.dnd_class = createSpell.dndClass.text ?? ""
        createdSpell.archetype = createSpell.archetype.text ?? ""
        createdSpell.circles = createSpell.circles.text ?? ""
        createdSpell.document_slug = "customSpell"
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
