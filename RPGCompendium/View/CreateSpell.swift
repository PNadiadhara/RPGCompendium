//
//  CreateSpell.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class CreateSpell: UIView {
    
    @IBOutlet var spellName: UITextField!
    
    @IBOutlet var spellDescription: UITextView!
    @IBOutlet var spellHigherDescription: UITextView!
    @IBOutlet var range: UITextField!
    @IBOutlet var components: UITextField!
    @IBOutlet var material: UITextField!
    @IBOutlet var ritual: UITextField!
    @IBOutlet var duration: UITextField!
    @IBOutlet var concentration: UITextField!
    @IBOutlet var castingTime: UITextField!
    @IBOutlet var level: UITextField!
    @IBOutlet var school: UITextField!
    @IBOutlet var dndClass: UITextField!
    @IBOutlet var archetype: UITextField!
    @IBOutlet var circles: UITextField!
    @IBOutlet var phbPage: UITextField!
    
    @IBOutlet var saveSpellButton: UIButton!
    private var authservice = AppDelegate.authservice
    
    @IBAction func saveSpell(_ sender: UIButton) {
        saveSpellButton.isEnabled = false
        guard let spellName = spellName.text,
            !spellName.isEmpty,
            let spellDescription = spellDescription.text,
            !spellDescription.isEmpty,
            let spellHighDescription = spellHigherDescription.text,
            !spellHighDescription.isEmpty,
            let range = range.text,
            !range.isEmpty,
            let components = components.text,
            !range.isEmpty,
            let material = material.text,
            !range.isEmpty,
            let ritual = ritual.text,
            !range.isEmpty,
            let duration = duration.text,
            !range.isEmpty,
            let concentration = concentration.text,
            !range.isEmpty,
            let castingTime = castingTime.text,
            !castingTime.isEmpty,
            let level = level.text,
            !level.isEmpty,
            let school = school.text,
            !school.isEmpty,
            let dndClass = dndClass.text,
            !dndClass.isEmpty,
            let archetype = archetype.text,
            !archetype.isEmpty,
            let circles = circles.text,
            !circles.isEmpty
            else {
                print("missing fields")
                return
        }
        guard let user = authservice.getCurrentUser() else {
            print("no logged user")
            return
        }
        let docRef = DBService.firestoreDB
            .collection(CharacterCollectionKeys.CollectionKey)
            .document()
        
        let spell = CharacterSpell(documentId: spellName, name: spellName, desc: spellDescription, higher_level: spellHighDescription, page: "", range: range, components: components, material: material, ritual: ritual, duration: duration, concentration: concentration, casting_time: castingTime, level: level, school: school, dnd_class: dndClass, archetype: archetype, circles: circles, document_slug: "CustomSpell")
        DBService.postCharacter(character: spell) { [weak self] error in
            if let error = error {
                print(error)
            } else {
                print("spell created")
            }
        }
        saveSpellButton.isEnabled = true
    }
    
}





