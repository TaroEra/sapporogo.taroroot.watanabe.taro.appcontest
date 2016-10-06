//
//  MapObjectTableTableViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/30.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit

class MapObjectTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    //    @IBOutlet weak var addressCell: UITableViewCell!
    //    @IBOutlet weak var phoneNumTextView: UITextView!
    //    @IBOutlet weak var faxNumTextView: UITextView!
    
    var mapObject:MapObject!
    var sectionTitles = ["住所","電話番号","FAX"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if mapObject.type == "予防接種_高齢"{
            sectionTitles.append("高齢者インフルエンザ")
            sectionTitles.append("高齢者用肺炎球菌")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("DetailCell")
        cell!.textLabel?.font = UIFont.systemFontOfSize(14)
        
        //住所
        if indexPath.section == 0{
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:"")
            if mapObject.address_number != " " {
                cell!.textLabel?.font = UIFont.systemFontOfSize(12)
                cell!.textLabel?.text = "〒\(mapObject.address_number)"
            }
            cell!.detailTextLabel?.font = UIFont.systemFontOfSize(14)
            cell!.detailTextLabel?.text = mapObject.address
        }
        
        //電話番号
        if indexPath.section == 1{
            cell!.textLabel?.text = mapObject.phone_number
        }
        
        //FAX
        if indexPath.section == 2{
            cell!.textLabel?.text = mapObject.fax_number
        }
        
        if mapObject.type == "予防接種_高齢"{
            
            let query = "id == " + String(mapObject.id.value!)
            let seniorVaccination = RealmSupport.realm.objects(SeniorVaccination).filter(query).first

            if sectionTitles[indexPath.section]=="高齢者インフルエンザ"{
                cell?.textLabel?.text = seniorVaccination!.influenza ? "◯" : "×"
            }
            
            if sectionTitles[indexPath.section]=="高齢者用肺炎球菌"{
                cell?.textLabel?.text = seniorVaccination!.pneumococcus ? "◯" : "×"
            }
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    
}
