//
//  ExtraContentsItem.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/28.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit

class ExtraContentsItem :ContentsItem{

    var point:Int?
    var isUnlock = false
    
    init (title:String?,
          fileName:String?,
          fileType:String?,
          purposeType:String?,
          contentsName:String?,
          contentsUrl:String?,
          
          point:Int?,
          isUnlock:Bool?){
        
        super.init(title: title,
                   fileName: fileName,
                   fileType: fileType,
                   purposeType: purposeType,
                   contentsName: contentsName,
                   contentsUrl: contentsUrl)
        
        self.point = point
        self.isUnlock = UserDefaultSurpport.userDefoults.bool(forKey: title!)
    }
}
