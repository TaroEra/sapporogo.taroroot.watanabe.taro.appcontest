//
//  MedicalPack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/15.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation
import RealmSwift

class Medicalpack: Pack {
    
    init() {
        super.init(name: "医療", contents:[
            ContentsItem(title:"札幌医師会", fileName:"", fileType:"", purposeType:"LINK"),
            ContentsItem(title:"医療機関情報マップ", fileName:"", fileType:"", purposeType:"LINK"),
            ContentsItem(title:"在宅医療情報マップ", fileName:"", fileType:"", purposeType:"LINK"),
            ContentsItem(title:"夜間休日診療案内", fileName:"", fileType:"", purposeType:"LINK")
            ])
    }
    
    func initalizeSapporoMedical(){
        let realm = try! Realm()
        let parseArray = CSVParser.parse("medical_link")
        for parseItem in parseArray{
            
                let contentsArray = parseItem as! NSArray
                
                let id = contentsArray[0].integerValue
                let type = contentsArray[1]
                let name = contentsArray[2]
                let url = contentsArray[3]
                
                let value = ["id":id,
                             "type":type,
                             "name":name,
                             "url":url]
                
                let object = SapproMedicak(value:value)
                
                try! realm.write{
                    realm.add(object, update: true)
                }
            }
        }
}