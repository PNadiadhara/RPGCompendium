//
//  Spell.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 2/28/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

struct Spell : Codable {
    let next : String
    let results : [SpellResults]
}

struct SpellResults : Codable{
    let name : String
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
}
