//
//  DoyurinTableViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/28.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit
import RealmSwift
import SafariServices

class DoyurinTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        let parseArray = CSVParser.parse("901_エクストラ_道有林語録")
        for item in parseArray{
            let arrayItem = item as! NSArray
            
            let id = (arrayItem[0] as! String).intValue
            let word = arrayItem[1]
            let kana_word = arrayItem[2]
            let mean = arrayItem[3]
            
            let doyurinItem:DoyurinItem = DoyurinItem(value:
                ["id":id,
                    "word":word,
                    "kana_word":kana_word,
                    "mean":mean])
            
            try! realm.write{
                realm.add(doyurinItem, update:true)
            }
        }
    }
    
    @IBAction func onTapContentsLinkButton(_ sender: AnyObject) {
        let safariViewController = SFSafariViewController(url:URL(string:"http://www.pref.hokkaido.lg.jp/sr/dyr/doyurinka/goroku.htm")!)
        self.navigationController?.pushViewController(safariViewController, animated: true)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = try! Realm().objects(DoyurinItem.self).count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let realm = try! Realm()
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoyurinItemCell", for: indexPath)
        let results = realm.objects(DoyurinItem.self)
        cell.textLabel?.text = results[indexPath.row].word + "（" + results[indexPath.row].kana_word + "）"
        cell.detailTextLabel?.text = results[indexPath.row].mean
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // 適当なセルの高さ
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
}
