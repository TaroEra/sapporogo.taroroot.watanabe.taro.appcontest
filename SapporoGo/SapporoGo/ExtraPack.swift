//
//  ExtraPack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/26.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class ExtraPack: Pack {
    
    init() {
        super.init(name: "エクストラ", contents:[
            
            ContentsItem(
                title:"交通機関マップ",
                fileName:"900_エクストラ_札幌交通機関",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"交通",
                contentsUrl:"http://www.city.sapporo.jp/kurashi/kotsu/index.html"),

            ContentsItem(
                title:"スーパー銭湯マップ",
                fileName:"902_エクストラ_札幌市内スーパー銭湯",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"",
                contentsUrl:""),
            
            ContentsItem(
                title:"公園のトイレマップ（中央区）",
                fileName:"",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"公園便所一覧",
                contentsUrl:"http://www.city.sapporo.jp/ryokuka/top/koueniji/benjoichiran.html")
            ])
    }
}
