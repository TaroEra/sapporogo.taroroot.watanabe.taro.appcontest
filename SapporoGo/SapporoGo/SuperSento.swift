//
//  SuperSento.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/10/06.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit
import RealmSwift

class SuperSento: Object {
    
    let id = RealmOptional<Int>()
    
    //料金
    dynamic var charge = 0
    //URL
    dynamic var url = ""
    //シャンプー等
    dynamic var sentoItem = ""
    //レンタルアメニティ
    dynamic var rental = ""
    //特記事項
    dynamic var special = ""
    //開店（00:00）
    dynamic var open = ""
    //閉店（00:00）
    dynamic var close = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
