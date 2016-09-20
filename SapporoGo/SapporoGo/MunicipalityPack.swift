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
            ContentsItem(title:"警察署、交番マップ", fileName:"police_station", fileType:"csv", purposeType:"MAP"),
            ContentsItem(title:"消防施設マップ", fileName:"fire_department", fileType:"csv", purposeType:"MAP" ),
            ContentsItem(title:"区役所、区民センターマップ", fileName:"ward_office", fileType:"csv", purposeType:"MAP"),
            ContentsItem(title:"コミュニティ地区センターマップ", fileName:"comunity_center", fileType:"csv", purposeType:"MAP"),
            ContentsItem(title:"まちづくり地区センターマップ", fileName:"town_planning_center", fileType:"csv", purposeType:"MAP"),
            ContentsItem(title:"保険センターマップ", fileName:"insurance_center", fileType:"csv", purposeType:"MAP"),
            ContentsItem(title:"土木センターマップ", fileName:"public_works_center", fileType:"csv", purposeType:"MAP"),
        ]
        super.init(name: "行政", contents:contents)
    }
}