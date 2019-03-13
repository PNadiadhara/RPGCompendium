//
//  DBServiceUser.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/13/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation
struct PlayerCollectionKeys {
    static let CollectionKey = "users"
    static let UserIdKey = "userId"
    static let DisplayNameKey = "displayName"
    static let EmailKey = "email"
    static let PhotoURLKey = "photoURL"
    static let JoinedDateKey = "joinedDate"
}

extension DBService {
    static public func createPlayer(user: Player, completion: @escaping (Error?) -> Void) {
        firestoreDB.collection(PlayerCollectionKeys.CollectionKey)
            .document(user.userId)
            .setData([ PlayerCollectionKeys.UserIdKey : user.userId,
                       PlayerCollectionKeys.DisplayNameKey : user.displayName,
                       PlayerCollectionKeys.EmailKey       : user.email,
                       PlayerCollectionKeys.PhotoURLKey    : user.photoURL ?? "",
                       PlayerCollectionKeys.JoinedDateKey  : user.joinedDate
            ]) { (error) in
                if let error = error {
                    completion(error)
                } else {
                    completion(nil)
                }
        }
    }
    
    static public func fetchUser(userId: String, completion: @escaping (Error?, Player?) -> Void) {
        DBService.firestoreDB
            .collection(PlayerCollectionKeys.CollectionKey)
            .whereField(PlayerCollectionKeys.UserIdKey, isEqualTo: userId)
            .getDocuments { (snapshot, error) in
                if let error = error {
                    completion(error, nil)
                } else if let snapshot = snapshot?.documents.first {
                    let characterCreator = Player(dict: snapshot.data())
                    completion(nil, characterCreator)
                }
        }
}
}
