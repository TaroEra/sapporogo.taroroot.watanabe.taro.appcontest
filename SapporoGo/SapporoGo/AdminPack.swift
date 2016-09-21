//
//  MunicipalityPack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/15.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class AdminPack: Pack {

    init(){
        let contents = [
            ContentsItem(title:"警察署、交番マップ", fileName:"admin_police", fileType:"csv", purposeType:"MAP"),
            ContentsItem(title:"消防施設マップ", fileName:"admin_fire", fileType:"csv", purposeType:"MAP" ),
            ContentsItem(title:"区役所、区民センターマップ", fileName:"admin_ward", fileType:"csv", purposeType:"MAP"),
            ContentsItem(title:"コミュニティ地区センターマップ", fileName:"admin_comunity", fileType:"csv", purposeType:"MAP"),
            ContentsItem(title:"まちづくりセンター・地区会館マップ", fileName:"admin_town", fileType:"csv", purposeType:"MAP"),
            ContentsItem(title:"保険センターマップ", fileName:"admin_insurance", fileType:"csv", purposeType:"MAP"),
            ContentsItem(title:"土木センターマップ", fileName:"admin_publicworks", fileType:"csv", purposeType:"MAP"),
        ]
        super.init(name: "行政", contents:contents)
    }
}