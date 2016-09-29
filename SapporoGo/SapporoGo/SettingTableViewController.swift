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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.visibleViewController?.navigationItem.title = "設定"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("userNameCell")
            cell?.textLabel?.text = "ユーザー名の変更"
            cell?.detailTextLabel?.text = UserDefaultSurpport.userName
            let image:UIImage!
            image = UIImage(named:"ic_user")
            cell!.imageView!.image = image.resize(CGSizeMake(20, 20))
            return cell!
        }
        else if indexPath.row == 1{
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
        
        if indexPath.row == 0{
            let alert:UIAlertController = UIAlertController(title:"ユーザー名の変更",
                                                            message: "ユーザー名を入力してください",
                                                            preferredStyle: UIAlertControllerStyle.Alert)
            
            //textfiledの追加
            alert.addTextFieldWithConfigurationHandler({(text:UITextField!) -> Void in})
            
            let textFields:Array<UITextField>? =  alert.textFields as Array<UITextField>?
            if textFields != nil {
                for textField:UITextField in textFields! {
                    //各textにアクセス
                    textField.text = UserDefaultSurpport.userName
                }
            }
            
            let defaultAction:UIAlertAction = UIAlertAction(title: "OK",
                                                            style: UIAlertActionStyle.Default,
                                                            handler:{
                                                                (action:UIAlertAction!) -> Void in
                                                                let textFields:Array<UITextField>? =  alert.textFields as Array<UITextField>?
                                                                if textFields != nil {
                                                                    for textField:UITextField in textFields! {
                                                                        //各textにアクセス
                                                                        if textField.text == ""{
                                                                            textField.text = "ゲスト"
                                                                        }
                                                                        UserDefaultSurpport.userName = textField.text
                                                                        self.tableView.cellForRowAtIndexPath(indexPath)?.detailTextLabel?.text = textField.text
                                                                        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HiraKakuProN-W6", size: 14)!]
                                                                    }
                                                                }
            })
            alert.addAction(defaultAction)
            alert.view.setNeedsLayout()
            presentViewController(alert, animated: true, completion: nil)
        }
    }
}
