//
//  DoyurinItem.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/28.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation
import RealmSwift

class DoyurinItem:Object {
    
    let id = RealmOptional<Int>()
    dynamic var word = ""
    dynamic var kana_word = ""
    dynamic var mean = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
