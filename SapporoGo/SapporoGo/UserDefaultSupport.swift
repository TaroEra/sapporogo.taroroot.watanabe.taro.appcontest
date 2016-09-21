//
//  UserDefaultSupport.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/21.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class UserDefaultSurpport{
    
    static let userDefault = NSUserDefaults.standardUserDefaults()
    
    static func setProfileImagePath(imagePath:NSURL){
        userDefault.setURL(imagePath, forKey:"profileImage")
    }
    
    static func getProfileImagePath()->NSURL{
        
        if userDefault.URLForKey("profileImage") !== nil{
            if let url:NSURL =  userDefault.URLForKey("profileImage")!{
                return url
            }
        }else{
            return NSURL(string:"")!
        }
    }
}