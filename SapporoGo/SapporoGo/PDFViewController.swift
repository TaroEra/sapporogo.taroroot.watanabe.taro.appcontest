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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaultSurpport.userPoint += 1
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let pdfFileName = contentsItem!.fileName! + "." + contentsItem!.fileType!
        let url:NSURL = NSBundle.mainBundle().URLForResource(pdfFileName, withExtension:nil)!
        
        let webView = UIWebView()
        webView.frame = UIScreen.mainScreen().bounds
        webView.loadRequest(NSURLRequest(URL:url))
        self.view.addSubview(webView)
    }
}
