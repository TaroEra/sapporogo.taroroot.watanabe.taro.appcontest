//
//  NursingPack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/15.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class NursingPack: Pack {
    
    init() {
        super.init(name: "介護", contents:[
            
            ContentsItem(
                title:"老人ホームマップ（有料）",
                fileName:"700_施設情報_有料老人ホーム",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"有料老人ホーム",
                contentsUrl:"http://www.city.sapporo.jp/kaigo/yuuryourouzinn.html")
            ])
    }
}
