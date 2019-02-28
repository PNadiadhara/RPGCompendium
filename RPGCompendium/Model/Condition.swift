//
//  Condition.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 2/28/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

struct Condition : Codable {
    let results : [ConditionResults]
}

struct ConditionResults : Codable {
    let slug : String
    let name : String
    let desc : String
    let document_slug : String
}


