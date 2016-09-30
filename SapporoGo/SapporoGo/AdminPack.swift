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
            
            ContentsItem(
                title:"消防施設マップ",
                fileName:"admin_fire",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"消防局・消防署（所）一覧",
                contentsUrl:"http://www.city.sapporo.jp/shobo/shokai/about/renraku/renrakul.html"),
            
            ContentsItem(
                title:"区役所、区民センターマップ",
                fileName:"admin_ward",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"札幌市の区勢",
                contentsUrl:"http://www.city.sapporo.jp/shimin/shinko/kusei-suishin/sasshi-kusei/"),
            
            ContentsItem(
                title:"コミュニティ地区センターマップ",
                fileName:"admin_comunity",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"札幌市の区勢",
                contentsUrl:"http://www.city.sapporo.jp/shimin/shinko/kusei-suishin/sasshi-kusei/"),
            
            ContentsItem(
                title:"まちづくりセンター・地区会館マップ",
                fileName:"admin_town",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"札幌市の区勢",
                contentsUrl:"http://www.city.sapporo.jp/shimin/shinko/kusei-suishin/sasshi-kusei/"),
            
            ContentsItem(
                title:"保険センターマップ",
                fileName:"admin_insurance",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"札幌市の区勢",
                contentsUrl:"http://www.city.sapporo.jp/shimin/shinko/kusei-suishin/sasshi-kusei/"),
            
            ContentsItem(
                title:"土木センターマップ",
                fileName:"admin_publicworks",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"札幌市の区勢",
                contentsUrl:"http://www.city.sapporo.jp/shimin/shinko/kusei-suishin/sasshi-kusei/"),
            ]
        
        super.init(name: "行政", contents:contents)
    }
}
