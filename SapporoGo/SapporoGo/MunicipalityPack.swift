//
//  MunicipalityPack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/15.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class MunicipalityPack: Pack {

    init(){
        let contents = [
            ContentsItem(title:"警察署、交番マップ", fileName:"police_station", fileType:"csv"),
            ContentsItem(title:"消防施設マップ", fileName:"fire_department", fileType:"csv"),
            ContentsItem(title:"区役所、区民センターマップ", fileName:"ward_office", fileType:"csv")
        ]
        super.init(name: "自治体", contents:contents)
    }
}