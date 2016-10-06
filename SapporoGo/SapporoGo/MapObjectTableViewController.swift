//
//  MapObjectTableTableViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/30.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit

class MapObjectTableViewController: UITableViewController {
    
    @IBOutlet weak var addressCell: UITableViewCell!
    @IBOutlet weak var phoneNumTextView: UITextView!
    @IBOutlet weak var faxNumTextView: UITextView!
    
    var mapObject:MapObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if mapObject.address_number != " " {
            addressCell.textLabel?.text  = "〒\(mapObject.address_number)"
        }
        addressCell.detailTextLabel?.text = mapObject.address
        
        phoneNumTextView.text = mapObject!.phone_number
        faxNumTextView.text = mapObject!.fax_number
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
