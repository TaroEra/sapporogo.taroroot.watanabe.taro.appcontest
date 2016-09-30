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
                title:"区役所、区民センターマップ",
                fileName:"100_行政情報_区役所_区民センター",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"札幌市の区勢",
                contentsUrl:"http://www.city.sapporo.jp/shimin/shinko/kusei-suishin/sasshi-kusei/"),
            
            ContentsItem(
                title:"コミュニティ地区センターマップ",
                fileName:"101_行政情報_コミュニティ_地区センター_集会施設",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"札幌市の区勢",
                contentsUrl:"http://www.city.sapporo.jp/shimin/shinko/kusei-suishin/sasshi-kusei/"),
            
            ContentsItem(
                title:"まちづくりセンター・地区会館マップ",
                fileName:"102_行政情報_まちづくり地区センター_地区会館",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"札幌市の区勢",
                contentsUrl:"http://www.city.sapporo.jp/shimin/shinko/kusei-suishin/sasshi-kusei/"),
            
            ContentsItem(
                title:"保険センターマップ",
                fileName:"104_行政情報_保健センター",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"札幌市の区勢",
                contentsUrl:"http://www.city.sapporo.jp/shimin/shinko/kusei-suishin/sasshi-kusei/"),
            
            ContentsItem(
                title:"土木センターマップ",
                fileName:"103_行政情報_土木センター",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"札幌市の区勢",
                contentsUrl:"http://www.city.sapporo.jp/shimin/shinko/kusei-suishin/sasshi-kusei/"),
            
            ContentsItem(
                title:"消防施設マップ",
                fileName:"106_行政情報_消防",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"消防局・消防署（所）一覧",
                contentsUrl:"http://www.city.sapporo.jp/shobo/shokai/about/renraku/renrakul.html")
            ]
        
        super.init(name: "行政", contents:contents)
    }
}
