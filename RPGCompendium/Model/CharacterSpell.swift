//
//  Character.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/13/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

struct CharacterSpell {
    let documentId: String
    let name: String
    let desc : String
    let higher_level : String
    let page : String
    let range : String
    let components : String
    let material : String
    let ritual : String
    let duration : String
    let concentration : String
    let casting_time : String
    let level : String
    let school : String
    let dnd_class : String
    let archetype : String
    let circles : String
    let document_slug : String
    
    init(documentId: String, name: String, desc : String,higher_level : String, page : String, range : String, components : String, material : String, ritual : String, duration : String, concentration : String, casting_time : String, level : String, school : String, dnd_class : String, archetype : String, circles : String, document_slug : String) {
        self.documentId = documentId
        self.name = name
        self.desc = desc
        self.higher_level = higher_level
        self.page = page
        self.range = range
        self.components = components
        self.material = material
        self.ritual = ritual
        self.duration = duration
        self.concentration = concentration
        self.casting_time = casting_time
        self.level = level
        self.school = school
        self.dnd_class = dnd_class
        self.archetype = archetype
        self.circles = circles
        self.document_slug = "CustomSpell"
        }
    
    init(dict: [String: Any]) {
        self.documentId = dict[CharacterCollectionKeys.DocumentIdKey] as? String ?? ""
        self.name = dict[CharacterCollectionKeys.NameKey] as? String ?? ""
        self.desc = dict[CharacterCollectionKeys.DescKey] as? String ?? ""
        self.higher_level = dict[CharacterCollectionKeys.Higher_levelKey] as? String ?? ""
        self.range = dict[CharacterCollectionKeys.RangeKey] as? String ?? ""
        self.page = dict[CharacterCollectionKeys.PageKey] as? String ?? ""
        self.components = dict[CharacterCollectionKeys.ComponentsKey] as? String ?? ""
        self.material = dict[CharacterCollectionKeys.MaterialKey] as? String ?? ""
        self.ritual = dict[CharacterCollectionKeys.RitualKey] as? String ?? ""
        self.duration = dict[CharacterCollectionKeys.DurationKey] as? String ?? ""
        self.concentration = dict[CharacterCollectionKeys.ConcentrationKey] as? String ?? ""
        self.casting_time = dict[CharacterCollectionKeys.CastingTimeKey] as? String ?? ""
        self.level = dict[CharacterCollectionKeys.LevelKey] as? String ?? ""
        self.school = dict[CharacterCollectionKeys.SchoolKey] as? String ?? ""
        self.dnd_class = dict[CharacterCollectionKeys.DnDClassKey] as? String ?? ""
        self.archetype = dict[CharacterCollectionKeys.ArchetypeKey] as? String ?? ""
        self.circles = dict[CharacterCollectionKeys.CirclesKey] as? String ?? ""
        self.document_slug = dict[CharacterCollectionKeys.DocumentSlugKey] as? String ?? ""
    }
}
