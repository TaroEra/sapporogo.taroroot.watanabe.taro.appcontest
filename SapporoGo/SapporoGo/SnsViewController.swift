//
//  SnsViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/13.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit
import Accounts
import Social

class SnsViewController: UIViewController {
    
    var accountStore = ACAccountStore()
    var twitterAccount:ACAccount?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectTwitterAccount()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.visibleViewController?.navigationItem.title = "共有"
    }
    @IBAction func onTapTwitter(sender: AnyObject) {
        postTweet()
    }
    
    private func selectTwitterAccount() {
        
        // 認証するアカウントのタイプを選択（他にはFacebookやWeiboなどがある）
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (granted:Bool, error:NSError?) -> Void in
            if error != nil {
                // エラー処理
                print("error! \(error)")
                return
            }
            
            if !granted {
                print("error! Twitterアカウントの利用が許可されていません")
                return
            }
            
            let accounts = self.accountStore.accountsWithAccountType(accountType) as! [ACAccount]
            if accounts.count == 0 {
                print("error! 設定画面からアカウントを設定してください")
                return
            }
            dispatch_async(dispatch_get_main_queue(), {
                self.showAccountSelectSheet(accounts)
            })
        }
    }

    // アカウント選択のActionSheetを表示する
    private func showAccountSelectSheet(accounts: [ACAccount]) {
        
        let alert = UIAlertController(title: "Twitter",
                                      message: "アカウントを選択してください",
                                      preferredStyle: .ActionSheet)
        
        // アカウント選択のActionSheetを表示するボタン
        for account in accounts {
            alert.addAction(UIAlertAction(title: account.username,
                style: .Default,
                handler: { (action) -> Void in
                    //
                    print("your select account is \(account)")
                    self.twitterAccount = account
            }))
        }
        
        // キャンセルボタン
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        // 表示する
        self.presentViewController(alert, animated: true, completion:nil)
    }
    
    // ツイートを投稿
    private func postTweet() {
        let URL = NSURL(string: "https://api.twitter.com/1.1/statuses/update.json")
        
        // ツイートしたい文章をセット
        let params = ["status" : ""]
        
        // リクエストを生成
        let request = SLRequest(forServiceType: SLServiceTypeTwitter,
                                requestMethod: .POST,
                                URL: URL,
                                parameters: params)
        
        // 取得したアカウントをセット
        request.account = self.twitterAccount
        
        // APIコールを実行
        request.performRequestWithHandler { (responseData, urlResponse, error) -> Void in
            
            if error != nil {
                print("error is \(error)")
            }
            else {
                // 結果の表示
                do{
                    let result = try NSJSONSerialization.JSONObjectWithData(responseData, options: .AllowFragments) as! NSDictionary
                    print("result is \(result)")
                }catch{}
                
            }
        }
    }
}
