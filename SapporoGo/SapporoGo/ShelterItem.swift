//
//  ShelterItem.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/21.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation
import RealmSwift

class ShelterItem:Object {

    let id = RealmOptional<Int>()
    dynamic var type = ""
    dynamic var name = ""
    dynamic var discription = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}