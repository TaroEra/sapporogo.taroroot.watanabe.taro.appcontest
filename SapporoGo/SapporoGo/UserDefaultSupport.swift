//
//  UserDefaultSupport.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/21.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class UserDefaultSurpport{
    
    class var userDefoults: NSUserDefaults {
        get{
            return NSUserDefaults.standardUserDefaults()
        }
    }
    
    private static let profileImageKey = "profileImage"
    class var profileImage:NSURL?{
        get{
            return self.userDefoults.URLForKey(profileImageKey)
        }
        set{
            self.userDefoults.setURL(newValue, forKey: profileImageKey)
        }
    }
}