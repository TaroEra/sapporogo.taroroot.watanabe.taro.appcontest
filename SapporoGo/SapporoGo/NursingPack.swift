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
            ContentsItem(title:"介護施設マップ", fileName:"nursing_home", fileType:"csv", purposeType:"MAP")
            ])
    }
}