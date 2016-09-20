//
//  TownPlanningCenter.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/20.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation
import RealmSwift

class TownPlanningCenter: Object {
    
    dynamic var name = ""
    dynamic var type = ""
    dynamic var latitude:Double=0.0
    dynamic var longitude:Double=0.0
    dynamic var address = ""
    
    override static func primaryKey() -> String? {
        return "name"
    }
}