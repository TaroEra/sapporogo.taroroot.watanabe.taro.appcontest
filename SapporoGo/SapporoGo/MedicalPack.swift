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
                title:"予防接種マップ",
                fileName:"330_医療情報_病院_カテゴリーなし",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"予防接種について",
                contentsUrl:"http://www.city.sapporo.jp/hokenjo/f1kansen/fy01yobousessyu.html"),
            
            ContentsItem(
                title:"予防接種マップ（高齢者）",
                fileName:"301_医療情報_高齢予防接種",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"高齢者用予防接種実施医療機関名簿",
                contentsUrl:"http://www.city.sapporo.jp/hokenjo/f1kansen/koureimeibo.html")
            ])
    }
}
