//
//  SettingTableViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/23.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit

class SettingTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("settingCell")
            cell?.textLabel?.text = "ライセンス情報"
            let image:UIImage!
            image = UIImage(named:"ic_copyright")
            cell!.imageView!.image = image.resize(CGSizeMake(20, 20))
            return cell!
        }
        else{
            let cell = tableView.dequeueReusableCellWithIdentifier("versionCell")
            cell?.textLabel?.text = "バージョン"
            let image:UIImage!
            cell?.detailTextLabel?.text = "1.0.0(6)"
            image = UIImage(named:"ic_info")
            cell!.imageView!.image = image.resize(CGSizeMake(20, 20))
            return cell!
        }

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
