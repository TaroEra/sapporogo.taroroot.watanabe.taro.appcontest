//
//  ContentsTableViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/13.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit

class ContentsTableViewController: UITableViewController {
    
    var pack:Pack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.hidden = true
        
        self.navigationItem.title = pack?.name
    }
    
    
    //MARK: - tableViewDelegate
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (self.pack?.contents?.count)!;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("ContentsCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = pack?.contents![indexPath.row].title
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if pack?.contents![indexPath.row].fileType == "csv"{
            let contentsMapViewController:ContentsMapViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("ContentsMapViewController")) as! ContentsMapViewController
            contentsMapViewController.contentsItem = self.pack?.contents![indexPath.row]
            self.navigationController?.pushViewController(contentsMapViewController, animated: true)
        }
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
