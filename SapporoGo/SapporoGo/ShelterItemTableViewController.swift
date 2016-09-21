//
//  ShelterItemTableViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/21.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit
import RealmSwift

class ShelterItemTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeShelterItem()
    }
    
    func initializeShelterItem(){
        
        let realm = try! Realm()
        let parseArray = CSVParser.parse("shelter_item")
        for item in parseArray{
            let arrayItem = item as! NSArray
            
            let id = arrayItem[0].integerValue
            let type = arrayItem[1]
            let name = arrayItem[2]
            let discription = arrayItem[3]
            
            let shelterItem:ShelterItem = ShelterItem(value: ["id":id, "type":type, "name":name, "discription":discription])
            
            try! realm.write{
                realm.add(shelterItem, update:true)
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = try! Realm().objects(ShelterItem).count
        return count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let realm = try! Realm()
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("ShelterItemCell", forIndexPath: indexPath)
        let results = realm.objects(ShelterItem)
        cell.textLabel?.text = results[indexPath.row].name
        cell.detailTextLabel?.text = results[indexPath.row].discription
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100 // 適当なセルの高さ
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10 // セルの上部のスペース
    }
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10 // セルの下部のスペース
    }
}
