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
        
        if pack?.contents![indexPath.row].title == "札幌市ごみ分別アプリ"{
            let targetString = "itms://itunes.com/app/札幌市ごみ分別アプリ"
            let encodedString = targetString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            let url:NSURL! = NSURL(string:encodedString!)
            UIApplication.sharedApplication().openURL(url)
        }

        
        if pack?.contents![indexPath.row].purposeType == "MAP"{
            let contentsMapViewController:ContentsMapViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("ContentsMapViewController")) as! ContentsMapViewController
            contentsMapViewController.contentsItem = self.pack?.contents![indexPath.row]
            contentsMapViewController.navigationItem.title = self.pack?.contents![indexPath.row].title
            self.navigationController?.pushViewController(contentsMapViewController, animated: true)
        }
        else if pack?.name == FinancialPack().name{
            let realm = try! Realm()
            let title:String! =  pack!.contents![indexPath.row].title
            let query = "name ='" + title + "'"
            let results = realm.objects(FinancialInstitutions).filter(query)
            var contentsItems = Array<ContentsItem>()
            
            for result in results{
                contentsItems.append(ContentsItem(title:result.sub_name, fileName:"", fileType:"", purposeType:"Financial_LINK"))
            }
            let contentsTableviewController:ContentsTableViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("ContentsTableViewController")) as! ContentsTableViewController
            contentsTableviewController.pack = Pack(name:title!, contents:contentsItems)
            contentsTableviewController.navigationItem.title = self.pack?.contents![indexPath.row].title
            self.navigationController?.pushViewController(contentsTableviewController, animated: true)
        }
        else if pack?.contents![indexPath.row].purposeType == "Financial_LINK"{
            
            let realm = try! Realm()
            let selectedTitle = pack?.contents![indexPath.row].title
            let query = "sub_name = '" + selectedTitle! + "'"
            let financialInstitutions = realm.objects(FinancialInstitutions).filter(query).first
            let url = NSURL(string:(financialInstitutions?.mobile_url)!)!
            let safariViewController = SFSafariViewController(URL:url)
            safariViewController.navigationItem.title = self.pack?.contents![indexPath.row].title
            self.navigationController?.pushViewController(safariViewController, animated: true)
        }
        else if pack?.name == Medicalpack().name{
            
            let realm = try! Realm()
            Medicalpack().initalizeSapporoMedical()
            let selectedTitle = pack?.contents![indexPath.row].title
            let query = "name = '" + selectedTitle! + "'"
            let sapporoMedical = realm.objects(SapproMedicak).filter(query).first
            let url = NSURL(string:(sapporoMedical?.url)!)!
            let safariViewController = SFSafariViewController(URL:url)
            safariViewController.navigationItem.title = self.pack?.contents![indexPath.row].title
            self.navigationController?.pushViewController(safariViewController, animated: true)
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
