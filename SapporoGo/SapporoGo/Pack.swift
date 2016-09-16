//
//  Pack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/15.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class Pack{
    
    var name :String
    var contents :Array<ContentsItem>?
    
    init(name:String, contents:Array<ContentsItem>){
        self.name = name
        self.contents = contents
    }
}