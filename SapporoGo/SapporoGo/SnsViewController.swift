//
//  SnsViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/28.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit
import Social
import Accounts

class SnsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var timelineTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let accountStore:ACAccountStore! = ACAccountStore()
    var twitterAccount:ACAccount?
    var timeLines:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.hidden = false
        self.navigationController?.visibleViewController?.navigationItem.title = "SNS"
        
        searchBar.delegate = self
        
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
        
        // Do any additional setup after loading the view.
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccountsWithType(accountType, options:nil){ (granted:Bool, error:NSError?) -> Void in
            
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
            
            self.showAccountSelectSheet(accounts)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                                            self.getTimeline("#即効札幌市民")
            }))
        }
        
        // キャンセルボタン
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        // 表示する
        dispatch_async(dispatch_get_main_queue(), {Void in
            self.presentViewController(alert, animated: true, completion: nil)
        })
    }
    
    // タイムラインを取得する
    private func getTimeline(searchString:String) {
        self.timeLines.removeAll()
        let targetString = "https://api.twitter.com/1.1/search/tweets.json?q=\(searchString)&count=20"
        let encodedString = targetString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        let URL = NSURL(string: encodedString!)//"https://api.twitter.com/1.1/statuses/home_timeline.json")
        
        // GET/POSTやパラメータに気をつけてリクエスト情報を生成
        let request = SLRequest(forServiceType: SLServiceTypeTwitter,
                                requestMethod: .GET,
                                URL: URL,
                                parameters: nil)
        
        // 認証したアカウントをセット
        request.account = twitterAccount
        
        // APIコールを実行
        request.performRequestWithHandler { (responseData, urlResponse, error) -> Void in
            
            if error != nil {
                print("error is \(error)")
            }
            else {
                // 結果の表示
                do{
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(responseData, options:.AllowFragments) as! NSDictionary
                    let result = jsonDictionary.objectForKey("statuses") as! NSArray
                    //                    let result = try NSJSONSerialization.JSONObjectWithData(responseData, options:.AllowFragments) as! NSArray
                    print(result)
                    for array in result{
                        var timeline = array.objectForKey("text")!
                        timeline =  timeline.stringByReplacingOccurrencesOfString("#即効札幌市民", withString:"")
                        print("result is \(timeline)")
                        // -> あいうえお
                        self.timeLines.append(timeline as! String)
                    }
                    dispatch_async(dispatch_get_main_queue(), {Void in
                        self.timelineTableView.reloadData()
                        self.timelineTableView.setNeedsLayout()
                        self.searchBar.text = "#即効札幌市民"
                    })
                    
                }catch{
                    print("sns service error")
                }
            }
        }
    }
    
    //MARK: - TableViewDelegate & DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeLines.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("timeLineCell")
        cell?.textLabel?.text = timeLines[indexPath.row]
        return cell!
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    //MARK: - SearchBarDelegate
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        getTimeline(searchBar.text!)
    }

}
