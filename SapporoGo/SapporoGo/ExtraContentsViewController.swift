//
//  ExtraContentsViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/28.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit
import Toast_Swift

class ExtraContentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var extraPack:ExtraPack = ExtraPack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let backButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        navigationItem.backBarButtonItem = backButtonItem
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (extraPack.contents?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("ExtraCell")!
        let view:ExtraCellView = UINib(nibName:"ExtraCellView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! ExtraCellView
        view.frame = cell.contentView.frame
        view.extraItem = extraPack.contents![indexPath.row] as? ExtraContentsItem
        cell.contentView.addSubview(view)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //選択したセルのコンテンツのポイントを表示
        let item:ExtraContentsItem = (extraPack.contents![indexPath.row] as? ExtraContentsItem)!
        let point = item.point
        
        //ポイントがあってunLock
        if item.isUnlock{
            //TODO：遷移
            
            if item.purposeType == "MAP"{
                let contentsMapViewController:ContentsMapViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("ContentsMapViewController")) as! ContentsMapViewController
                contentsMapViewController.contentsItem = item
                contentsMapViewController.navigationItem.title = item.title!
                self.navigationController?.pushViewController(contentsMapViewController, animated: true)
            }
            else if item.purposeType == "LIST"{
                
                let contentsTableviewController:DoyurinTableViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("DoyurinTableViewController")) as! DoyurinTableViewController
                contentsTableviewController.navigationItem.title = item.title
                self.navigationController?.pushViewController(contentsTableviewController, animated: true)
            }
            
            return
        }
        
        //ポイントがあってLock
        if UserDefaultSurpport.userPoint >= point{
            // Alert の場合
            let alert:UIAlertController = UIAlertController(title:"SPコンテンツ解禁",
                                                            message: "ptを使用してこのコンテンツをアンロックします。よろしいですか？",
                                                            preferredStyle: UIAlertControllerStyle.Alert
            )
            
            // Cancel 一つだけしか指定できない
            let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel",
                                                           style: UIAlertActionStyle.Cancel,
                                                           handler:{
                                                            (action:UIAlertAction!) -> Void in
                                                            
            })
            
            // Default 複数指定可
            let defaultAction:UIAlertAction = UIAlertAction(title: "アンロック",
                                                            style: UIAlertActionStyle.Default,
                                                            handler:{
                                                                (action:UIAlertAction!) -> Void in
                                                                UserDefaultSurpport.userDefoults.setBool(true, forKey: item.title!)
                                                                UserDefaultSurpport.userPoint = UserDefaultSurpport.userPoint - item.point!
                                                                
                                                                let cell:UITableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)!
                                                                
                                                                for subView:UIView in cell.contentView.subviews {
                                                                    subView.removeFromSuperview()
                                                                }
                                                                
                                                                let view:ExtraCellView = UINib(nibName:"ExtraCellView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! ExtraCellView
                                                                view.frame = cell.contentView.frame
                                                                self.extraPack = ExtraPack()
                                                                view.extraItem = self.extraPack.contents![indexPath.row] as? ExtraContentsItem
                                                                cell.contentView.addSubview(view)
                                                                tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimation.None)
            })
            
            alert.addAction(cancelAction)
            alert.addAction(defaultAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
            //ポイントがなくてlock
        else if UserDefaultSurpport.userPoint < point{
            self.view.makeToast("ptが不足しています。", duration: 1.0, position:.Center)
        }
    }
}
