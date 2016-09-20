//
//  File.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/16.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation
import RealmSwift

class MapObject:Object{
    
    let id = RealmOptional<Int>()
    dynamic var name = ""
    dynamic var type = ""
    dynamic var latitude:Double=0.0
    dynamic var longitude:Double=0.0
    dynamic var address = ""
    dynamic var address_number = ""
    dynamic var phone_number = ""
    dynamic var fax_number = ""
    
    dynamic var file_name = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}