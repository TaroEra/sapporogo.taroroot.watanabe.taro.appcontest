//
//  ExtraPack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/26.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class ExtraPack: Pack {
    
    static func isUnLock(userDefaultKey:String?) -> Bool{
        
        if let isUnlock:Bool! = ((UserDefaultSurpport.userDefoults.objectForKey(userDefaultKey!) as? Bool) != nil)
        {
            return isUnlock
        }
        UserDefaultSurpport.userDefoults.setBool(false, forKey:userDefaultKey!)
        return false
    }
    
    init() {
        super.init(name: "エクストラ", contents:[
            
            ExtraContentsItem(
                title:"交通機関マップ",
                fileName:"900_エクストラ_札幌交通機関",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"交通",
                contentsUrl:"http://www.city.sapporo.jp/kurashi/kotsu/index.html",
                point:10,
                isUnlock:ExtraPack.isUnLock("交通機関マップ")),
            
            ExtraContentsItem(
                title:"スーパー銭湯マップ",
                fileName:"902_エクストラ_札幌市内スーパー銭湯",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"",
                contentsUrl:"",
                point:10,
                isUnlock:ExtraPack.isUnLock("スーパー銭湯マップ")),
            
            ExtraContentsItem(
                title:"公園のトイレマップ（中央区）",
                fileName:"",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"公園便所一覧",
                contentsUrl:"http://www.city.sapporo.jp/ryokuka/top/koueniji/benjoichiran.html",
                point:10,
                isUnlock:ExtraPack.isUnLock("公園のトイレマップ（中央区）"))
            ])
    }
}
