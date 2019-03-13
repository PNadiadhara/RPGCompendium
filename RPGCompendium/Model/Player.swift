//
//  Player.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/13/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

struct Player {
    let userId: String
    let displayName: String
    let email: String
    let photoURL: String?
    let joinedDate: String
    
    init(userId: String, displayName: String, email: String, photoURL: String?, joinedDate: String) {
        self.userId = userId
        self.displayName = displayName
        self.email = email
        self.photoURL = photoURL
        self.joinedDate = joinedDate
    }
    
    init(dict: [String: Any]) {
        self.userId = dict[PlayerCollectionKeys.UserIdKey] as? String ?? ""
        self.displayName = dict[PlayerCollectionKeys.DisplayNameKey] as? String ?? ""
        self.email = dict[PlayerCollectionKeys.EmailKey] as? String ?? ""
        self.photoURL = dict[PlayerCollectionKeys.PhotoURLKey] as? String ?? ""
        self.joinedDate = dict[PlayerCollectionKeys.JoinedDateKey] as? String ?? ""
    }
}
