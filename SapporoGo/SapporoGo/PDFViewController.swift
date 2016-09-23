//
//  PDFViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/20.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController {
    
    var contentsItem:ContentsItem?
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        UserDefaultSurpport.userPoint += 1
        self.view.makeToast("get 1pt", duration: 1.0, position:.Bottom)
        
        let pdfFileName = contentsItem!.fileName! + "." + contentsItem!.fileType!
        let url:NSURL = NSBundle.mainBundle().URLForResource(pdfFileName, withExtension:nil)!
        webView.loadRequest(NSURLRequest(URL:url))
    }
}
