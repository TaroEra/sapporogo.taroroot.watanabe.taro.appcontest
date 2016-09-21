
//
//  TabBarController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/16.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedIndex = 1;
        let backButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        navigationItem.backBarButtonItem = backButtonItem
    }
}
