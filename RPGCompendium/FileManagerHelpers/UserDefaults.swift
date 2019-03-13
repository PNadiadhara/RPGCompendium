//
//  UserDefaults.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 3/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

struct UserDefaultsManager {
    static var profileNameKey = "ProfileName"
    static var profileImageKey = "ProfileImage"
    
    static func retrieveImage() -> UIImage {
        var imageToReturn = UIImage()
        if let userName = UserDefaults.standard.object(forKey: UserDefaultsManager.profileNameKey) as? String {
            if let imageData = UserDefaults.standard.object(forKey: UserDefaultsManager.profileImageKey + userName) as? Data{
                if let image = UIImage(data: imageData){
                    imageToReturn = image
                }
            }
            
        } else {
            imageToReturn = UIImage(named: "placeholder-image")!
        }
        return imageToReturn
    }
}
