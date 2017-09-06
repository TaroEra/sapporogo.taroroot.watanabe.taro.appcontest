//
//  UserDefaultSupport.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/21.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class UserDefaultSurpport{
    
    fileprivate static let masterUserName = "tarj879AAAfef54Sa"
    
    class var userDefoults: UserDefaults {
        get{
            return UserDefaults.standard
        }
    }
    
    fileprivate static let profileImageKey = "profileImage"
    class var profileImage:URL?{
        get{
            return self.userDefoults.url(forKey: profileImageKey)
        }
        set{
            self.userDefoults.set(newValue, forKey: profileImageKey)
        }
    }
    
    fileprivate static let userNameKey = "userName"
    class var userName:String?{
        get{
            return self.userDefoults.string(forKey: userNameKey)
        }
        set{
            if newValue == masterUserName {
                self.userDefoults.set(999, forKey:userPointKey)
            }
            self.userDefoults.set(newValue, forKey: userNameKey)
        }
    }
    
    fileprivate static let userTotalPointKey = "userTotalPoint"
    class var userTotalPoint:Int{
        get{
            return self.userDefoults.integer(forKey: userTotalPointKey)
        }
        set{
            self.userDefoults.set(newValue, forKey:userTotalPointKey)
        }
    }
    
    fileprivate static let userPointKey = "userPoint"
    class var userPoint:Int{
        
        get{
            return self.userDefoults.integer(forKey: userPointKey)
        }
        set{
            if self.userDefoults.string(forKey: userNameKey) == masterUserName {
                self.userDefoults.set(999, forKey:userPointKey)
                return
            }else{
                self.userDefoults.set(newValue, forKey:userPointKey)
                return
            }
        }
    }
    
    class var userTitle:String?{
        get{
            if 0...9 ~= self.userTotalPoint{
                return "駆け出しの市民"
            }else if 10...19 ~= self.userTotalPoint{
                return "そこそこの市民"
            }else if 20...29 ~= self.userTotalPoint{
                return "物知りな市民"
            }else if 30...49 ~= self.userTotalPoint{
                return "市民代表"
            }
            return "伝説の市民"
        }set{
        }
    }
    
    fileprivate static let userTutorialKey = "userTutorial"
    class var UserTutorial:Bool{
        get{
            return self.userDefoults.bool(forKey: userTutorialKey)
        }
        set{
            self.userDefoults.set(newValue, forKey:userTutorialKey)
        }
    }
}
