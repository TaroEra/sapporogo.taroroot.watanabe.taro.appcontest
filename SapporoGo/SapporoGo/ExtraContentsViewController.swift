//
//  ExtraContentsViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/28.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit
import Toast_Swift
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}


class ExtraContentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var extraPack:ExtraPack = ExtraPack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let backButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        navigationItem.backBarButtonItem = backButtonItem
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (extraPack.contents?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ExtraCell")!
        let view:ExtraCellView = UINib(nibName:"ExtraCellView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! ExtraCellView
        view.frame = cell.contentView.frame
        view.extraItem = extraPack.contents![indexPath.row] as? ExtraContentsItem
        cell.contentView.addSubview(view)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        //選択したセルのコンテンツのポイントを表示
        let item:ExtraContentsItem = (extraPack.contents![indexPath.row] as? ExtraContentsItem)!
        let point = item.point
        
        //ポイントがあってunLock
        if item.isUnlock{
            //TODO：遷移
            
            if item.purposeType == "MAP"{
                let contentsMapViewController:MapViewController = (self.storyboard?.instantiateViewController(withIdentifier: "ContentsMapViewController")) as! MapViewController
                contentsMapViewController.contentsItem = item
                contentsMapViewController.navigationItem.title = item.title!
                self.navigationController?.pushViewController(contentsMapViewController, animated: true)
            }
            else if item.purposeType == "LIST"{
                
                let contentsTableviewController:DoyurinTableViewController = (self.storyboard?.instantiateViewController(withIdentifier: "DoyurinTableViewController")) as! DoyurinTableViewController
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
                                                            preferredStyle: UIAlertControllerStyle.alert
            )
            
            // Cancel 一つだけしか指定できない
            let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel",
                                                           style: UIAlertActionStyle.cancel,
                                                           handler:{
                                                            (action:UIAlertAction!) -> Void in
                                                            
            })
            
            // Default 複数指定可
            let defaultAction:UIAlertAction = UIAlertAction(title: "アンロック",
                                                            style: UIAlertActionStyle.default,
                                                            handler:{
                                                                (action:UIAlertAction!) -> Void in
                                                                UserDefaultSurpport.userDefoults.set(true, forKey: item.title!)
                                                                UserDefaultSurpport.userPoint = UserDefaultSurpport.userPoint - item.point!
                                                                
                                                                let cell:UITableViewCell = self.tableView.cellForRow(at: indexPath)!
                                                                
                                                                for subView:UIView in cell.contentView.subviews {
                                                                    subView.removeFromSuperview()
                                                                }
                                                                
                                                                let view:ExtraCellView = UINib(nibName:"ExtraCellView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! ExtraCellView
                                                                view.frame = cell.contentView.frame
                                                                self.extraPack = ExtraPack()
                                                                view.extraItem = self.extraPack.contents![indexPath.row] as? ExtraContentsItem
                                                                cell.contentView.addSubview(view)
                                                                tableView.reloadRows(at: [indexPath], with:UITableViewRowAnimation.none)
            })
            
            alert.addAction(cancelAction)
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)
        }
            //ポイントがなくてlock
        else if UserDefaultSurpport.userPoint < point{
            self.view.makeToast("ptが不足しています。", duration: 1.0, position:.center)
        }
    }
}
