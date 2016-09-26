//
//  ChildcarePack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/15.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class ChildcarePack: Pack {
    
    init() {
        super.init(name: "育児", contents:[
            
            ContentsItem(
                title:"保育園マップ（認可）",
                fileName:"600_育児_認可保育所",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"保育所について",
                contentsUrl:"http://www.city.sapporo.jp/kodomo/kosodate/l4_01.html")
            ])
    }
}
