//
//  HomeViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/09.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    private var selectedCellTiele:String = ""
    @IBOutlet weak var tableView: UITableView!
    
    private var basicPacks:Array<Pack> = []
    private var supportPacks:Array<Pack> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.basicPacks = [MunicipalityPack(), Medicalpack(), ResourcePack(), DisasterPack()]
        self.supportPacks = [NursingPack(), ChildcarePack()]
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    //MARK: - tableViewDelegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {return "基本パック"}
        if section == 1 {return "特殊パック"}
        return ""
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{return self.basicPacks.count;}
        if section == 1{return self.supportPacks.count;}
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        if(indexPath.section == 0){
            let pack:Pack = self.basicPacks[indexPath.row]
            cell.textLabel?.text = pack.name
        }
        if(indexPath.section == 1){
            let pack:Pack = self.supportPacks[indexPath.row]
            cell.textLabel?.text = pack.name        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let contentsTableviewController:ContentsTableViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("ContentsTableViewController")) as! ContentsTableViewController
        
        var pack:Pack!
        if(indexPath.section == 0){
            pack = self.basicPacks[indexPath.row]
        }else{
            pack = self.supportPacks[indexPath.row]
        }
        contentsTableviewController.pack = pack;
        self.navigationController?.pushViewController(contentsTableviewController, animated: true);
    }
}