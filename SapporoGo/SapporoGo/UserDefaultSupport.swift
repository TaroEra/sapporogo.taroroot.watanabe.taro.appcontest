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
    
    private static let userNameKey = "userName"
    class var userName:String?{
        get{
            return self.userDefoults.stringForKey(userNameKey)
        }
        set{
            self.userDefoults.setObject(newValue, forKey: userNameKey)
        }
    }
    
    private static let userPointKey = "userPoint"
    class var userPoint:Int{
        get{
            return self.userDefoults.integerForKey(userPointKey)
        }
        set{
            self.userDefoults.setInteger(newValue, forKey:userPointKey)
        }
    }
    
    class var userTitle:String?{
        get{
            if 0...9 ~= self.userPoint{
                return "駆け出しの市民"
            }else if 10...19 ~= self.userPoint{
                return "そこそこの市民"
            }else if 20...29 ~= self.userPoint{
                return "物知りな市民"
            }else if 30...49 ~= self.userPoint{
                return "市民代表"
            }
            return "伝説の市民"
        }set{
        }
    }
}
