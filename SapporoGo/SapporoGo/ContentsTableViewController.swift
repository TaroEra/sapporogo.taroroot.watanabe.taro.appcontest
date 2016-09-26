//
//  ContentsTableViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/13.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit
import RealmSwift
import SafariServices

class ContentsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var pack:Pack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.hidden = true
        self.navigationItem.title = pack?.name
        
        let backButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        navigationItem.backBarButtonItem = backButtonItem
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    //MARK: - tableViewDelegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let pack = self.pack{
            return pack.contents!.count;
        }
        else {
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("ContentsCell", forIndexPath: indexPath)
        
        let contentsItem:ContentsItem = (pack?.contents![indexPath.row])!
        let image:UIImage!
        
        cell.textLabel?.text = contentsItem.title
        
        if contentsItem.purposeType == "MAP"{
            image = UIImage(named:"ic_map")
        }
        else if contentsItem.purposeType == "PDF"{
            image = UIImage(named:"ic_pdf")
        }
        else if contentsItem.purposeType == "LINK" || contentsItem.purposeType == "Financial_LINK"{
            image = UIImage(named:"ic_link")
        }
        else if contentsItem.purposeType == "LIST"{
            image = UIImage(named:"ic_list")
        }
        else if contentsItem.purposeType == "WEB"{
            image = UIImage(named:"ic_web")
        }
        else{
            image = UIImage(named:"")
        }
        
        if let image = image{
            cell.imageView!.image = image.resize(CGSizeMake(20, 20))
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if pack?.contents![indexPath.row].purposeType == "MAP"{
            let contentsMapViewController:ContentsMapViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("ContentsMapViewController")) as! ContentsMapViewController
            contentsMapViewController.contentsItem = self.pack?.contents![indexPath.row]
            contentsMapViewController.navigationItem.title = self.pack?.contents![indexPath.row].title
            self.navigationController?.pushViewController(contentsMapViewController, animated: true)
        }
        else if pack?.name == Medicalpack().name{
            
            UserDefaultSurpport.userPoint += 1
            
//            let realm = try! Realm()
//            Medicalpack().initalizeSapporoMedical()
//            let selectedTitle = pack?.contents![indexPath.row].title
//            let query = "name = '" + selectedTitle! + "'"
//            let sapporoMedical = realm.objects(SapproMedicak).filter(query).first
//            let url = NSURL(string:(sapporoMedical?.url)!)!
//            let safariViewController = SFSafariViewController(URL:url)
//            safariViewController.navigationItem.title = self.pack?.contents![indexPath.row].title
//            self.navigationController?.pushViewController(safariViewController, animated: true)
//            
//            self.view.window?.makeToast("get 1pt", duration: 1.0, position:CGPointMake((UIScreen.mainScreen().bounds.width)/2, (UIScreen.mainScreen().bounds.height)-80))

        }
        else if pack?.contents![indexPath.row].fileType == "pdf"{
            let pdfViewController:PDFViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("PDFViewController")) as! PDFViewController
            pdfViewController.view.frame = UIScreen.mainScreen().bounds
            pdfViewController.contentsItem = pack?.contents![indexPath.row]
            pdfViewController.navigationItem.title = self.pack?.contents![indexPath.row].title
            self.navigationController?.pushViewController(pdfViewController, animated: true)
        }
        else if pack?.contents![indexPath.row].purposeType == "LIST"{
            
            let contentsTableviewController:ShelterItemTableViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("ShelterItemTableViewController")) as! ShelterItemTableViewController
            contentsTableviewController.navigationItem.title = self.pack?.contents![indexPath.row].title
            self.navigationController?.pushViewController(contentsTableviewController, animated: true)
        }
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
