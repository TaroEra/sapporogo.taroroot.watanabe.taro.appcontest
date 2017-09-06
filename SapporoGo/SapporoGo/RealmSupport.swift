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
    
    class func initalizeRealmObject(_ fileName:String){
        
//        print(realm.configuration.fileURL)
        
        let sections = CSVParser.parse(fileName)
        for section in sections{
            
            let sectionItem = section as! NSArray
            
            //ここで分岐させるべきかも

            initializeMapObject(fileName, sectionItem:sectionItem)
            
            if fileName.contains("医療情報_高齢予防接種"){
                initializeSeniorVaccination(fileName, sectionItem:sectionItem)
            }
            
            if fileName.contains("スーパー銭湯"){
                initializeSuperSento(fileName, sectionItem: sectionItem)
            }
        }
    }
    
    class fileprivate func initializeMapObject(_ fileName:String, sectionItem:NSArray){
        
        let array = sectionItem
        
        let id:Int = (array[0] as AnyObject).integerValue
        let type = array[1]
        let name = array[2]
        let latitude = (array[3] as AnyObject).doubleValue
        let longitude = (array[4] as AnyObject).doubleValue
        
        var address = "北海道"
        
        let all_address = array[5] as! String
        if all_address.contains("札幌市"){
            address = address.appending(all_address)
        }
        else if all_address.contains("区"){
            address = address.appending(array[7] as! String)
            address = address.appending(all_address)
        }
        else{
            address = address.appending(array[7] as! String)
            address = address.appending(array[6] as! String)
            address = address.appending(all_address)
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
                      "latitude":latitude ?? 0.0,
                      "longitude":longitude ?? 0.0,
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
    
    class fileprivate func initializeSeniorVaccination(_ fileName:String, sectionItem:NSArray){
        
        let array = sectionItem
        let id:Int = (array[0] as AnyObject).integerValue
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
                     "pneumococcus":pneumococcus] as [String : Any]
        
        let seniorVaccination = SeniorVaccination(value:value)
        
        try! realm.write{
            realm.add(seniorVaccination, update: true)
        }
    }
    
    class  fileprivate func initializeSuperSento(_ fileName:String, sectionItem:NSArray){
       
        let array = sectionItem
        let id:Int = (array[0] as AnyObject).integerValue
        let charge = (array[12] as AnyObject).integerValue
        let url = array[13]
        let sentoItem = array[16]
        let rental = array[17]
        let special = array[18]
        let open = array[19]
        let close = array[20]
        
        let value = ["id":id,
                     "charge":charge ?? 0,
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
