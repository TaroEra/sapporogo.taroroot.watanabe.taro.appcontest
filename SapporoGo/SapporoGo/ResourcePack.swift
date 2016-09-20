//
//  ResourcePack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/15.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class ResourcePack: Pack {
    
    init(){
        super.init(name: "ごみ・資源", contents:[
            ContentsItem(title:"ごみ情報（English）", fileName:"garbage_english", fileType:"pdf", purposeType:"PDF"),
            ContentsItem(title:"ごみ情報（Korean）", fileName:"garbage_korean", fileType:"pdf", purposeType:"PDF"),
            ContentsItem(title:"ごみ情報（Chinese）", fileName:"garbage_chinese", fileType:"pdf", purposeType:"PDF"),
            ContentsItem(title:"札幌ごみアプリ", fileName:"", fileType:"", purposeType:"")])
    }
}