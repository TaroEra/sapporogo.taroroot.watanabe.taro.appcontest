//
//  DefaultRealm.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/30.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import RealmSwift

class RealmSupport {
    
    class var realm : Realm{
        return try! Realm()
    }
    
    class func initalizeRealmObject(fileName:String){
        
        let realm = try! Realm()
        
        let sections = CSVParser.parse(fileName)
        for sectionsItem in sections{
            
            //ここで分岐させるべきかも
            let mapObject = MapObject(value:createMapObjectValue(fileName, sectionItem:sectionsItem as! NSArray))
            try! realm.write{
                realm.add(mapObject, update: true)
            }
        }
    }
    
    class private func createMapObjectValue(fileName:String, sectionItem:NSArray) -> NSDictionary{
        
        let array = sectionItem
        
        let id:Int = array[0].integerValue
        let type = array[1]
        let name = array[2]
        let latitude = array[3].doubleValue
        let longitude = array[4].doubleValue
        
        var address = "北海道"
        
        let all_address = array[5] as! String
        if all_address.containsString("札幌市"){
            address = address.stringByAppendingString(all_address)
        }
        else if all_address.containsString("区"){
            address = address.stringByAppendingString(array[7] as! String)
            address = address.stringByAppendingString(all_address)
        }
        else{
            address = address.stringByAppendingString(array[7] as! String)
            address = address.stringByAppendingString(array[6] as! String)
            address = address.stringByAppendingString(all_address)
        }
        
        let addressNumber = array[8]
        var phoneNumber = array[9]
        if phoneNumber as! String == " "{
            phoneNumber = "なし"
        }
        
        var faxNumber = array[10]
        if faxNumber as! String == " "{
            faxNumber = "なし"
        }
        
        let valule = ["id":id,
                      "type":type,
                      "name":name,
                      "latitude":latitude,
                      "longitude":longitude,
                      "address":address,
                      "file_name":fileName,
                      "address_number":addressNumber,
                      "phone_number":phoneNumber,
                      "fax_number":faxNumber]
        return valule
    }
}
