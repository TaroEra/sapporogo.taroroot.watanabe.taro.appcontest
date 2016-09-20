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
        
        if let contents = self.pack!.contents{
            return contents.count;
        }
        else {
            return 0
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("ContentsCell", forIndexPath: indexPath)
        
        let contentsItem:ContentsItem = (pack?.contents![indexPath.row])!
        let image:UIImage!
        
        cell.textLabel?.text = contentsItem.title
        //        cell.textLabel!.font = UIFont(name: "HirakakuProN-W6",size: 14)
        
        if contentsItem.purposeType == "MAP"{
            image = UIImage(named:"ic_map")
        }
        else if contentsItem.purposeType == "PDF"{
            image = UIImage(named:"ic_pdf")
        }
        else if contentsItem.purposeType == "LINK"{
            image = UIImage(named:"ic_link")
        }
        else{
            image = UIImage(named:"")
        }
        
        if let image = image{
            cell.imageView!.image = image.resize(CGSizeMake(20, 20))
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if pack?.contents![indexPath.row].purposeType == "MAP"{
            let contentsMapViewController:ContentsMapViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("ContentsMapViewController")) as! ContentsMapViewController
            contentsMapViewController.contentsItem = self.pack?.contents![indexPath.row]
            self.navigationController?.pushViewController(contentsMapViewController, animated: true)
        }
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
