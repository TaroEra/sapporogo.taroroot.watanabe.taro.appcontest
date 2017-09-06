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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.visibleViewController?.navigationItem.title = "設定"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "userNameCell")
            cell?.textLabel?.text = "ユーザー名の変更"
            cell?.detailTextLabel?.text = UserDefaultSurpport.userName
            let image:UIImage!
            image = UIImage(named:"ic_user")
            cell!.imageView!.image = image.resize(CGSize(width: 20, height: 20))
            return cell!
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")
            cell?.textLabel?.text = "ライセンス情報"
            let image:UIImage!
            image = UIImage(named:"ic_copyright")
            cell!.imageView!.image = image.resize(CGSize(width: 20, height: 20))
            return cell!
        }
        else{
            
            let version: String! = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
            let build: String! = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "versionCell")
            cell?.textLabel?.text = "バージョン"
            let image:UIImage!
            cell?.detailTextLabel?.text = "\(version)(\(build))"
            image = UIImage(named:"ic_info")
            cell!.imageView!.image = image.resize(CGSize(width: 20, height: 20))
            return cell!
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0{
            let alert:UIAlertController = UIAlertController(title:"ユーザー名の変更",
                                                            message: "ユーザー名を入力してください",
                                                            preferredStyle: UIAlertControllerStyle.alert)
            
            //textfiledの追加
            alert.addTextField(configurationHandler: {(text:UITextField!) -> Void in})
            
            let textFields:Array<UITextField>? =  alert.textFields as Array<UITextField>?
            if textFields != nil {
                for textField:UITextField in textFields! {
                    //各textにアクセス
                    textField.text = UserDefaultSurpport.userName
                }
            }
            
            let defaultAction:UIAlertAction = UIAlertAction(title: "OK",
                                                            style: UIAlertActionStyle.default,
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
                                                                        self.tableView.cellForRow(at: indexPath)?.detailTextLabel?.text = textField.text
                                                                        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HiraKakuProN-W6", size: 14)!]
                                                                    }
                                                                }
            })
            alert.addAction(defaultAction)
            alert.view.setNeedsLayout()
            present(alert, animated: true, completion: nil)
        }
    }
}
