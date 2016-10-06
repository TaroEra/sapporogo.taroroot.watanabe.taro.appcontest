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
        
//        print(realm.configuration.fileURL)
        
        let sections = CSVParser.parse(fileName)
        for section in sections{
            
            let sectionItem = section as! NSArray
            
            //ここで分岐させるべきかも

            initializeMapObject(fileName, sectionItem:sectionItem)
            
            if fileName.containsString("医療情報_高齢予防接種"){
                initializeSeniorVaccination(fileName, sectionItem:sectionItem)
            }
            
            if fileName.containsString("スーパー銭湯"){
                initializeSuperSento(fileName, sectionItem: sectionItem)
            }
        }
    }
    
    class private func initializeMapObject(fileName:String, sectionItem:NSArray){
        
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
        
        let mapObject = MapObject(value:valule)
        try! realm.write{
            realm.add(mapObject, update: true)
        }
    }
    
    class private func initializeSeniorVaccination(fileName:String, sectionItem:NSArray){
        
        let array = sectionItem
        let id:Int = array[0].integerValue
        var influenza = false
        var pneumococcus = false
        
        if (array[12] as! String) != " "{
            influenza = true
        }
        
        if(array[13] as! String) != " "{
            pneumococcus = true
        }
        
        let value = ["id":id,
                     "influenza":influenza,
                     "pneumococcus":pneumococcus]
        
        let seniorVaccination = SeniorVaccination(value:value)
        
        try! realm.write{
            realm.add(seniorVaccination, update: true)
        }
    }
    
    class  private func initializeSuperSento(fileName:String, sectionItem:NSArray){
       
        let array = sectionItem
        let id:Int = array[0].integerValue
        let charge = array[12].integerValue
        let url = array[13]
        let sentoItem = array[16]
        let rental = array[17]
        let special = array[18]
        let open = array[19]
        let close = array[20]
        
        let value = ["id":id,
                     "charge":charge,
                     "url":url,
                     "sentoItem":sentoItem,
                     "rental":rental,
                     "special":special,
                     "open":open,
                     "close":close]
        
        let superSento = SuperSento(value:value)
        
        try! realm.write{
            realm.add(superSento, update: true)
        }
    }
}
