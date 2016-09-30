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
                title:"高齢者予防接種マップ（中央区）",
                fileName:"301_医療情報_高齢予防接種中央区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"予防接種について",
                contentsUrl:"http://www.city.sapporo.jp/hokenjo/f1kansen/fy01yobousessyu.html"),
            
            ContentsItem(
                title:"高齢者予防接種マップ（北区）",
                fileName:"302_医療情報_高齢予防接種北区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"予防接種について",
                contentsUrl:"http://www.city.sapporo.jp/hokenjo/f1kansen/fy01yobousessyu.html"),
            
            ContentsItem(
                title:"高齢者予防接種マップ（東区）",
                fileName:"303_医療情報_高齢予防接種東区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"予防接種について",
                contentsUrl:"http://www.city.sapporo.jp/hokenjo/f1kansen/fy01yobousessyu.html"),
            
            ContentsItem(
                title:"高齢者予防接種マップ（白石区）",
                fileName:"304_医療情報_高齢予防接種白石区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"予防接種について",
                contentsUrl:"http://www.city.sapporo.jp/hokenjo/f1kansen/fy01yobousessyu.html"),
            
            ContentsItem(
                title:"高齢者予防接種マップ（厚別区）",
                fileName:"305_医療情報_高齢予防接種厚別区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"予防接種について",
                contentsUrl:"http://www.city.sapporo.jp/hokenjo/f1kansen/fy01yobousessyu.html"),
            
            ContentsItem(
                title:"高齢者予防接種マップ（豊平区）",
                fileName:"306_医療情報_高齢予防接種豊平区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"予防接種について",
                contentsUrl:"http://www.city.sapporo.jp/hokenjo/f1kansen/fy01yobousessyu.html"),
            
            ContentsItem(
                title:"高齢者予防接種マップ（清田区）",
                fileName:"307_医療情報_高齢予防接種清田区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"予防接種について",
                contentsUrl:"http://www.city.sapporo.jp/hokenjo/f1kansen/fy01yobousessyu.html"),
            
            ContentsItem(
                title:"高齢者予防接種マップ（南区）",
                fileName:"308_医療情報_高齢予防接種南区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"予防接種について",
                contentsUrl:"http://www.city.sapporo.jp/hokenjo/f1kansen/fy01yobousessyu.html"),
            
            ContentsItem(
                title:"高齢者予防接種マップ（西区）",
                fileName:"309_医療情報_高齢予防接種西区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"予防接種について",
                contentsUrl:"http://www.city.sapporo.jp/hokenjo/f1kansen/fy01yobousessyu.html"),
            
            ContentsItem(
                title:"高齢者予防接種マップ（手稲区）",
                fileName:"310_医療情報_高齢予防接種手稲区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"予防接種について",
                contentsUrl:"http://www.city.sapporo.jp/hokenjo/f1kansen/fy01yobousessyu.html"),
            
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
