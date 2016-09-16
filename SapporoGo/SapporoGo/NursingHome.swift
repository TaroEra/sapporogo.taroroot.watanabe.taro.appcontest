//
//  NursingHome.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/16.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation
import RealmSwift

//@property NSString *name;
//@property NSString *type;
//@property double latitude;
//@property double longitude;
//@property NSString *address;

class NursingHome:Object {
    
    dynamic var name = ""
    dynamic var type = ""
    dynamic var latitude:Double=0.0
    dynamic var longitude:Double=0.0
    dynamic var address = ""
    
    override static func primaryKey() -> String? {
        return "name"
    }
}