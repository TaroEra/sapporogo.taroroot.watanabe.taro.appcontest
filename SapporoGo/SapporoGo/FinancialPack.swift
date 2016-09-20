//
//  FinancialPack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/20.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class FinancialPack: Pack {
    
    init() {
        super.init(name: "金融機関", contents:[ContentsItem(title:"金融機関リンク", fileName:"link_financial_institutions", fileType:"csv", purposeType:"LIST")])
    }
}