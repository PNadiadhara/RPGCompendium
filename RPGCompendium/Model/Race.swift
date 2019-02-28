//
//  Race.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 2/28/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

struct Race : Codable {
    let results : [RaceResults]
}

struct RaceResults : Codable {
    let name : String
    let slug : String
    let desc : String
    let document_slug : String
    let asi_desc : String
    let asi : [asiResults]
    let age : String
    let alignment : String
    let size : String
    let speed : RaceSpeed
    let speed_desc : String
    let languages : String
    let vision : String
    let traits : String
    let subraces : [RaceSubrace]
}

struct asiResults : Codable {
    let attributes : [String]
    let value : Int
}

struct RaceSpeed : Codable {
    let walk : Int
}

struct RaceSubrace : Codable {
    let name : String
    let slug : String
    let desc : String
    let asi : [RaceSubraceAsi]
    let asi_desc : String
    let document_slug : String
}

struct RaceSubraceAsi : Codable {
    let attributes : [String]
    let value : String
}


