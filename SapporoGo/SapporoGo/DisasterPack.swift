//
//  File.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/15.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class DisasterPack:Pack {
    
    init() {
        super.init(name: "災害対策", contents:[
            ContentsItem(title:"基幹避難所", fileName:"shelter_core", fileType:"csv", purposeType:"MAP"),
            ContentsItem(title:"広域避難所", fileName:"shelter_wide", fileType:"csv", purposeType:"MAP"),
            ContentsItem(title:"地域避難所", fileName:"shelter_region", fileType:"csv", purposeType:"MAP"),
            ContentsItem(title:"災害時の持ち物リスト", fileName:"disaster_prevention", fileType:"csv", purposeType:"LIST")
            ])
    }
}