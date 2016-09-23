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
        self.view.makeToast("get 1pt", duration: 1.0, position:.Bottom)
        
        tableView.dataSource = self
        tableView.delegate = self
        
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
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = try! Realm().objects(ShelterItem).count
        return count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let realm = try! Realm()
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("ShelterItemCell", forIndexPath: indexPath)
        let results = realm.objects(ShelterItem)
        cell.textLabel?.text = results[indexPath.row].name
        cell.detailTextLabel?.text = results[indexPath.row].discription
        return cell
    }
    
     func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100 // 適当なセルの高さ
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
}
