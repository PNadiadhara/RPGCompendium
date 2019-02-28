//
//  Job.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 2/28/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

struct Job : Codable {
    let results : [JobResults]
}

struct JobResults : Codable {
    let name : String
    let slug : String
    let desc : String
    let document_slug : String
    let hit_dice : String
    let hp_at_1st_level : String
    let hp_at_higher_levels : String
    let prof_armor : String
    let prof_weapons : String
    let prof_tools : String
    let prof_saving_throws : String
    let prof_skills : String
    let equipment : String
    let table : String
    let spellcasting_ability : String
    let subtypes_name : String
    let archetypes : [Archetypes]
}

struct Archetypes : Codable {
    let name : String
    let slug : String
    let desc : String
    let document_slug : String
}
