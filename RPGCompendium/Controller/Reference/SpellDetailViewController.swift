//
//  SpellDetailViewController.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

protocol SpellDetailViewControllerDelegate: AnyObject {
    func saveSpellToCharacterInfo(spell: SpellResults)
}

class SpellDetailViewController: UIViewController {
    
    weak var delegate: SpellDetailViewControllerDelegate?
    private var authservice = AppDelegate.authservice
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var labelForLables: [UILabel]!
    @IBOutlet var spellName: UILabel!
    @IBOutlet var descTextView: UITextView!
    @IBOutlet var higherDescTextView: UITextView!
    @IBOutlet var range: UILabel!
    @IBOutlet var components: UILabel!
    @IBOutlet var material: UILabel!
    @IBOutlet var ritual: UILabel!
    @IBOutlet var concentration: UILabel!
    @IBOutlet var level: UILabel!
    @IBOutlet var school: UILabel!
    @IBOutlet var dndClass: UILabel!
    @IBOutlet var archetype: UILabel!
    @IBOutlet var circles: UILabel!
    @IBOutlet var phbPage: UILabel!
    
    public var passedSpell : SpellResults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "cave_bg")
        // Do any additional setup after loading the view.
        
        configureSettings()
        
    }
    
    func configureSettings() {
        title = passedSpell.name
        spellName.text = passedSpell.name
        spellName.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        descTextView.text = passedSpell.desc
        descTextView.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        higherDescTextView.text = passedSpell.higher_level
        higherDescTextView.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        range.text = passedSpell.range
        range.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        components.text = passedSpell.components
        components.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        material.text = passedSpell.material
        material.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        ritual.text = passedSpell.ritual
        ritual.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        concentration.text = passedSpell.ritual
        concentration.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        level.text = passedSpell.level
        level.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        school.text = passedSpell.school
        school.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        dndClass.text = passedSpell.dnd_class
        dndClass.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        archetype.text = passedSpell.archetype
        archetype.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        circles.text = passedSpell.circles
        circles.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        phbPage.text = passedSpell.page
        phbPage.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)
        labelForLables?.forEach{$0.backgroundColor = UIColor(patternImage: UIImage(named: "textLabelBG")!)}
    }
    
//    @IBAction func saveSpell(_ sender: UIButton) {
//        self.delegate?.saveSpellToCharacterInfo(spell: passedSpell)
//        okAlertController()
//    }
    @IBAction func saveButtonPressed(_ sender: Any) {
        if let userName = authservice.getCurrentUser()?.displayName as? String {
            let spellToSave = passedSpell
            let spellSaved = DataPersistenceModel.getSpells(userName: userName)
            okAlertController()
        }
    }
    
    func okAlertController() {
        let alertController = UIAlertController(title: "Spell Saved", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            print("ok pressed")
        }
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }

    

}
