//
//  DBSerivceCharacter.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/13/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation
struct CharacterCollectionKeys {
    static let DocumentIdKey = "documentId"
    static let CollectionKey = "spells"
    static let NameKey = "name"
    static let DescKey = "desc"
    static let Higher_levelKey = "higher_level"
    static let PageKey = "page"
    static let RangeKey = "range"
    static let ComponentsKey = "components"
    static let MaterialKey = "materials"
    static let RitualKey = "ritual"
    static let DurationKey = "duration"
    static let ConcentrationKey = "concentration"
    static let CastingTimeKey = "casting_time"
    static let LevelKey = "level"
    static let SchoolKey = "school"
    static let DnDClassKey = "dnd_class"
    static let ArchetypeKey = "archetype"
    static let CirclesKey = "circles"
    static let DocumentSlugKey = "CustomSpell"
    
}

extension DBService {
    static public func postCharacter(character: CharacterSpell, completion: @escaping (Error?) -> Void) {
        firestoreDB.collection(CharacterCollectionKeys.CollectionKey)
            .document(character.documentId).setData([
                CharacterCollectionKeys.NameKey     : character.name,
                CharacterCollectionKeys.DescKey           : character.desc,
                CharacterCollectionKeys.Higher_levelKey          : character.higher_level,
                CharacterCollectionKeys.PageKey  : character.page,
                CharacterCollectionKeys.RangeKey        : character.range,
                CharacterCollectionKeys.ComponentsKey      : character.components,
                CharacterCollectionKeys.MaterialKey      : character.material,
                CharacterCollectionKeys.RitualKey      : character.ritual,
                CharacterCollectionKeys.DurationKey      : character.duration,
                CharacterCollectionKeys.ConcentrationKey      : character.concentration,
                CharacterCollectionKeys.CastingTimeKey      : character.casting_time,
                CharacterCollectionKeys.LevelKey      : character.level,
                CharacterCollectionKeys.SchoolKey     : character.school,
                CharacterCollectionKeys.DnDClassKey      : character.dnd_class,
                CharacterCollectionKeys.ArchetypeKey      : character.archetype,
                CharacterCollectionKeys.CirclesKey      : character.circles,
                CharacterCollectionKeys.DocumentSlugKey      : character.document_slug
                ])
            { (error) in
                if let error = error {
                    completion(error)
                } else {
                    completion(nil)
                }
        }
    }
    
    static public func deleteSpell(character: CharacterSpell, completion: @escaping (Error?) -> Void) {
        DBService.firestoreDB
            .collection(CharacterCollectionKeys.CollectionKey)
            .document(character.documentId)
            .delete { (error) in
                if let error = error {
                    completion(error)
                } else {
                    completion(nil)
                }
        }
    }
    

}
