//
//  MedicalPack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/15.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class Medicalpack: Pack {
    
    init() {
        super.init(name: "医療", contents:[ContentsItem(title:"札幌医師会へのリンク", fileName:"link_sapporo_medical", fileType:"csv")])
    }
}