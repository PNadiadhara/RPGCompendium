//
//  DataPersistenceManager.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

final class DataPersistenceManager {
    private init() {}
    
    static func documentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    static func filepathToDocumentsDiretory(filename: String) -> URL {
        return documentsDirectory().appendingPathComponent(filename)
    }
}
