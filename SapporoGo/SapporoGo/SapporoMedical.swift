//
//  SapporoMedicalObject.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/20.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation
import RealmSwift

//ID,施設種類,名称,URL,情報種類
class SapproMedicak:Object{
    
    dynamic var id:Int = 0
    dynamic var type = ""
    dynamic var name = ""
    dynamic var url = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}