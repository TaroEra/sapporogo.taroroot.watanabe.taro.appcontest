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
        
        self.contentsLinkButton.setTitle(contentsItem!.contentsName, for: UIControlState())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserDefaultSurpport.userPoint += 1
        UserDefaultSurpport.userTotalPoint += 1

        self.view.makeToast("get 1pt", duration: 1.0, position:.bottom)
        
        let pdfFileName = contentsItem!.fileName! + "." + contentsItem!.fileType!
        let url:URL = Bundle.main.url(forResource: pdfFileName, withExtension:nil)!
        webView.loadRequest(URLRequest(url:url))
    }
    
    @IBAction func onTapContentsLinkButton(_ sender: AnyObject) {
        let safariViewController = SFSafariViewController(url:URL(string:contentsItem!.contentsUrl!)!)
        self.navigationController?.pushViewController(safariViewController, animated: true)
    }
}
