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
    
    var mapObject:MapObject!
    var sectionTitles = ["住所","電話番号","FAX"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerNib(UINib(nibName: "LinkCell", bundle: nil), forCellReuseIdentifier: "LinkCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if mapObject.type == "予防接種_高齢"{
            sectionTitles.append("高齢者インフルエンザ")
            sectionTitles.append("高齢者用肺炎球菌")
        }
        
        if mapObject.type == "スーパー銭湯"{
            sectionTitles.append("料金")
            sectionTitles.append("URL")
            sectionTitles.append("シャンプー等")
            sectionTitles.append("レンタルアメニティ")
            sectionTitles.append("特記事項")
            sectionTitles.append("開店時間")
            sectionTitles.append("閉店時間")
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
            let linkCell = tableView.dequeueReusableCellWithIdentifier("LinkCell") as! LinkCell
            linkCell.textView?.text = mapObject.phone_number
            cell = linkCell
        }
        
        //FAX
        if indexPath.section == 2{
            let linkCell = tableView.dequeueReusableCellWithIdentifier("LinkCell") as! LinkCell
            linkCell.textView?.text = mapObject.fax_number
            cell = linkCell
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
        
        if mapObject.type == "スーパー銭湯"{
            
            let query = "id == " + String(mapObject.id.value!)
            let superSento = RealmSupport.realm.objects(SuperSento).filter(query).first
            
            if sectionTitles[indexPath.section]=="料金"{
                cell?.textLabel?.text = String(superSento!.charge) + "円"
            }
            if sectionTitles[indexPath.section]=="URL"{
                let linkCell = tableView.dequeueReusableCellWithIdentifier("LinkCell") as! LinkCell
                linkCell.textView?.text = String(superSento!.url)
                cell = linkCell
            }
            if sectionTitles[indexPath.section]=="シャンプー等"{
                cell?.textLabel?.text = String(superSento!.sentoItem)
            }
            if sectionTitles[indexPath.section]=="レンタルアメニティ"{
                cell?.textLabel?.text = String(superSento!.rental)
            }
            if sectionTitles[indexPath.section]=="特記事項"{
                cell?.textLabel?.text = String(superSento!.special)
            }
            if sectionTitles[indexPath.section]=="開店時間"{
                cell?.textLabel?.text = String(superSento!.open)
            }
            if sectionTitles[indexPath.section]=="閉店時間"{
                cell?.textLabel?.text = String(superSento!.close)
            }
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    
}
