//
//  FinancialInstitutions.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/20.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation
import RealmSwift

//ID,施設種類,名称,名称_区別,URL_PC,URL_Mobile,管轄,情報種類
class FinancialInstitutions:Object{
    
    let id = RealmOptional<Int>()
    dynamic var type = ""
    dynamic var name = ""
    dynamic var sub_name = ""
    dynamic var pc_url = ""
    dynamic var mobile_url = ""
    dynamic var jurisdiction = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}