//
//  File.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/16.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation
import RealmSwift

class WardOffice:Object{
    
    dynamic var id:Int = 0
    dynamic var name = ""
    dynamic var type = ""
    dynamic var latitude:Double=0.0
    dynamic var longitude:Double=0.0
    dynamic var address = ""
    dynamic var address_number = ""
    dynamic var phone_number = ""
    dynamic var fax_number = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}