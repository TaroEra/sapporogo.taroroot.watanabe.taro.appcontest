//
//  MedicalDentalClinicPack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/10/06.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation
import RealmSwift

class MedicalDentalClinicPack: Pack {
    
    init() {
        super.init(name: "歯科医院マップ", contents:[
            
            ContentsItem(
                title:"歯科医院マップ（中央区）",
                fileName:"340_医療情報_歯科医院_中央区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"道内医療機関の名簿について",
                contentsUrl:"http://www.pref.hokkaido.lg.jp/hf/iyk/iry/iryoukikanmeibo.htm"),
            
            ContentsItem(
                title:"歯科医院マップ（北区）",
                fileName:"341_医療情報_歯科医院_北区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"道内医療機関の名簿について",
                contentsUrl:"http://www.pref.hokkaido.lg.jp/hf/iyk/iry/iryoukikanmeibo.htm"),
            
            ContentsItem(
                title:"歯科医院マップ（東区）",
                fileName:"342_医療情報_歯科医院_東区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"道内医療機関の名簿について",
                contentsUrl:"http://www.pref.hokkaido.lg.jp/hf/iyk/iry/iryoukikanmeibo.htm"),
            
            ContentsItem(
                title:"歯科医院マップ（白石区）",
                fileName:"343_医療情報_歯科医院_白石区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"道内医療機関の名簿について",
                contentsUrl:"http://www.pref.hokkaido.lg.jp/hf/iyk/iry/iryoukikanmeibo.htm"),
            
            ContentsItem(
                title:"歯科医院マップ（厚別区）",
                fileName:"344_医療情報_歯科医院_厚別区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"道内医療機関の名簿について",
                contentsUrl:"http://www.pref.hokkaido.lg.jp/hf/iyk/iry/iryoukikanmeibo.htm"),
            
            ContentsItem(
                title:"歯科医院マップ（豊平区）",
                fileName:"345_医療情報_歯科医院_豊平区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"道内医療機関の名簿について",
                contentsUrl:"http://www.pref.hokkaido.lg.jp/hf/iyk/iry/iryoukikanmeibo.htm"),
            
            ContentsItem(
                title:"歯科医院マップ（清田区）",
                fileName:"346_医療情報_歯科医院_清田区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"道内医療機関の名簿について",
                contentsUrl:"http://www.pref.hokkaido.lg.jp/hf/iyk/iry/iryoukikanmeibo.htm"),
            
            ContentsItem(
                title:"歯科医院マップ（南区）",
                fileName:"347_医療情報_歯科医院_南区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"道内医療機関の名簿について",
                contentsUrl:"http://www.pref.hokkaido.lg.jp/hf/iyk/iry/iryoukikanmeibo.htm"),
            
            ContentsItem(
                title:"歯科医院マップ（西区）",
                fileName:"348_医療情報_歯科医院_西区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"道内医療機関の名簿について",
                contentsUrl:"http://www.pref.hokkaido.lg.jp/hf/iyk/iry/iryoukikanmeibo.htm"),
            
            ContentsItem(
                title:"歯科医院マップ（手稲区）",
                fileName:"349_医療情報_歯科医院_手稲区",
                fileType:"csv",
                purposeType:"MAP",
                contentsName:"道内医療機関の名簿について",
                contentsUrl:"http://www.pref.hokkaido.lg.jp/hf/iyk/iry/iryoukikanmeibo.htm"),
            ])
    }
}
