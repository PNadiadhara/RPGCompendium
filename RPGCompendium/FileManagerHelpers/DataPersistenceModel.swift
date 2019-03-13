//
//  DataPersistenceModel.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

struct DataPersistenceModel {
    
    private static var spells = [SpellResults]()
    
    static func saveSpells(userName: String){
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: userName)
        do {
            let data = try PropertyListEncoder().encode(spells)
            try data.write(to: path, options: .atomic)
        } catch {
            print("Property list encoding error \(error)")
        }
    }
    static func saveSpell(userName: String,spell: SpellResults){
        spells.append(spell)
        saveSpells(userName: userName)
    }
    
    static func deleteSpell(userName: String, index: Int){
        spells.remove(at: index)
        saveSpells(userName: userName)
    }
    static func getSpells(userName: String) -> [SpellResults]{
        
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: userName).path
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path){
                do {
                    spells = try PropertyListDecoder().decode([SpellResults].self, from: data)
                    spells = spells.sorted{$0.name < $1.name}
                }catch{
                    print("Property list decoding error: \(error)")
                }
            } else {
                print("getPhotoJournal data is nil")
            }
        } else {
            print("\(userName) does not exist")
        }
        return spells
    }
    
}
