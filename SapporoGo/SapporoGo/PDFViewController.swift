//
//  PDFViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/20.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit
import SafariServices

class PDFViewController: UIViewController {
    
    var contentsItem:ContentsItem?
    
    @IBOutlet weak var contentsLinkButton: UIButton!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentsLinkButton.setTitle(contentsItem!.contentsName, forState: UIControlState.Normal)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        UserDefaultSurpport.userPoint += 1
        self.view.makeToast("get 1pt", duration: 1.0, position:.Bottom)
        
        let pdfFileName = contentsItem!.fileName! + "." + contentsItem!.fileType!
        let url:NSURL = NSBundle.mainBundle().URLForResource(pdfFileName, withExtension:nil)!
        webView.loadRequest(NSURLRequest(URL:url))
    }
    
    @IBAction func onTapContentsLinkButton(sender: AnyObject) {
        let safariViewController = SFSafariViewController(URL:NSURL(string:contentsItem!.contentsUrl!)!)
        self.navigationController?.pushViewController(safariViewController, animated: true)
    }
}
