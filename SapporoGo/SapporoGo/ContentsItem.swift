//
//  File.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/15.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation


class ContentsItem{
    
    var title:String?
    var fileName:String?
    var fileType:String?
    var purposeType:String?
    var contentsName:String?
    var contentsUrl:String?
    
    init (title:String?,
          fileName:String?,
          fileType:String?,
          purposeType:String?,
          contentsName:String?,
          contentsUrl:String?){
        
        self.title = title
        self.fileName = fileName
        self.fileType = fileType
        self.purposeType = purposeType
        self.contentsName = contentsName
        self.contentsUrl = contentsUrl;
    }
}
