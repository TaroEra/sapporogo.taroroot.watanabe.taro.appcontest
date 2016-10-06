//
//  MedicalPack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/15.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation
import RealmSwift

class Medicalpack: Pack {
    
    init() {
        super.init(name: "医療", contents:[
            
            ContentsItem(
                title:"高齢者予防接種マップ",
                fileName:"",
                fileType:"",
                purposeType:"MAP",
                contentsName:"",
                contentsUrl:""),
            
            ContentsItem(
                title:"歯科医院マップ",
                fileName:"",
                fileType:"",
                purposeType:"MAP",
                contentsName:"",
                contentsUrl:""),
            
            ContentsItem(
                title:"病院マップ",
                fileName:"330_医療情報_病院",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"医療機関名簿",
                contentsUrl:"http://www.pref.hokkaido.lg.jp/hf/iyk/iry/iryoukikanmeibo.htm")
            ])
    }
}
