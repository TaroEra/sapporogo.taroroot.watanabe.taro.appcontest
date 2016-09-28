//
//  ExtraCellView.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/28.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit

class ExtraCellView: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    var extraItem:ExtraContentsItem?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var pointLabel: UILabel!
    
    override func drawRect(rect: CGRect) {
        
        if let extraContentsItem = self.extraItem {
            
            titleLabel.text = extraContentsItem.title
            pointLabel.text = String(extraContentsItem.point!)
            
            if extraContentsItem.isUnlock{
                self.lockImageView.image = UIImage(named:"ic_unlock")
            }else{
                self.lockImageView.image = UIImage(named:"ic_lock")
            }
        }
    }
}
