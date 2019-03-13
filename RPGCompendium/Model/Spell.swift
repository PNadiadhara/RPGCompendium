//
//  Spell.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 2/28/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

struct Spell : Codable {
    let next : String?
    let results : [SpellResults]
}

struct SpellResults : Codable{
    var name : String
    var desc : String
    var higher_level : String
    var page : String
    var range : String
    var components : String
    var material : String
    var ritual : String
    var duration : String
    var concentration : String
    var casting_time : String
    var level : String
    var school : String
    var dnd_class : String
    var archetype : String
    var circles : String
    var document_slug : String
}
