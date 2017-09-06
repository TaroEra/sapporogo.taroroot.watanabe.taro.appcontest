//
//  ShelterItemTableViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/21.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit
import RealmSwift

class ShelterItemTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaultSurpport.userPoint += 1
        UserDefaultSurpport.userTotalPoint += 1
        
        self.view.makeToast("get 1pt", duration: 1.0, position:.bottom)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        initializeShelterItem()
    }
    
    func initializeShelterItem(){
        
        let realm = try! Realm()
        let parseArray = CSVParser.parse("shelter_item")
        for item in parseArray{
            let arrayItem = item as! NSArray
            let id = (arrayItem[0] as! String).intValue
            let type = arrayItem[1]
            let name = arrayItem[2]
            let discription = arrayItem[3]
            
            let shelterItem:ShelterItem = ShelterItem(value: ["id":id, "type":type, "name":name, "discription":discription])
            
            try! realm.write{
                realm.add(shelterItem, update:true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = try! Realm().objects(ShelterItem.self).count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let realm = try! Realm()
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShelterItemCell", for: indexPath)
        let results = realm.objects(ShelterItem.self)
        cell.textLabel?.text = results[indexPath.row].name
        cell.detailTextLabel?.text = results[indexPath.row].discription
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // 適当なセルの高さ
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
}
