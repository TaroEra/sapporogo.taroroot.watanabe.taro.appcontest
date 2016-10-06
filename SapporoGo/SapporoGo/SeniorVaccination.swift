//
//  File.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/10/06.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation
import RealmSwift

class SeniorVaccination:Object  {
    
    let id = RealmOptional<Int>()
    dynamic var influenza = false
    dynamic var pneumococcus = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
