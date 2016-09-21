//
//  FinancialPack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/20.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation
import RealmSwift

class FinancialPack: Pack {
    
    init() {
        super.init(name: "金融機関", contents:[])
    }
    
    func initializeFinantialInstitutions(){
        let realm = try! Realm()
        let array = CSVParser.parse("financial_link")
        
        for contents in array{
            let contentsArray = contents as! NSArray
            let id = contentsArray[0].integerValue
            let type = contentsArray[1]
            let name = contentsArray[2]
            let sub_name = contentsArray[3]
            let pc_url = contentsArray[4]
            let mobile_url = contentsArray[5]
            let jurisdiction = contentsArray[6]
            
            let value = ["id":id,
                         "type":type,
                         "name":name,
                         "sub_name":sub_name,
                         "pc_url":pc_url,
                         "mobile_url":mobile_url,
                         "jurisdiction":jurisdiction]
            
            let object = FinancialInstitutions(value: value)
            
            try! realm.write{
                realm.add(object, update: true)
            }
        }
    }
    
    func createContents()->Array<ContentsItem>?{
        
        let realm = try! Realm()
        
        let titles = NSMutableOrderedSet()
        var contents:Array<ContentsItem>! = Array()
        
        for object in realm.objects(FinancialInstitutions){
            titles.addObject(object.name)
        }
        for title in titles{
            contents!.append(ContentsItem(title:title as? String, fileName:"", fileType:"", purposeType:"LINK"))
        }
        return contents
    }
}