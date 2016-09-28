//
//  HomeViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/09.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit
import Photos
import Toast_Swift
import RealmSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    private var selectedCellTiele:String = ""
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPointLabel: UILabel!
    
    private var basicPacks:Array<Pack> = []
    private var supportPacks:Array<Pack> = []
    
    @IBOutlet weak var userTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.basicPacks = [AdminPack(), Medicalpack(), ResourcePack(), DisasterPack()]
        self.supportPacks = [NursingPack(), ChildcarePack()]
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        changeprofileImage()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.hidden = false
        self.navigationController?.visibleViewController?.navigationItem.title = "ホーム"
        navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name:"HiraginoSans-W4", size: 14)!]
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if !UserDefaultSurpport.UserTutorial{
            
            UserDefaultSurpport.UserTutorial = true
            
            // Alert の場合
            let alert:UIAlertController = UIAlertController(title:"「即効！札幌市民」って？",
                                                            message: "このアプリは札幌に関する様々な情報を確認することができます。\n\n情報を閲覧するたびにポイントがたまり、それを使うことによってSPコンテンツにある情報を解禁することができます。\n\nたくさんの情報を閲覧し、札幌市民に必要な情報を入手しましょう",
                                                            preferredStyle: UIAlertControllerStyle.Alert
            )
            
            // Cancel 一つだけしか指定できない
            let cancelAction:UIAlertAction = UIAlertAction(title:"OK",
                                                           style: UIAlertActionStyle.Cancel,
                                                           handler:{
                                                            (action:UIAlertAction!) -> Void in
                                                            self.configureProfileLabel()
                }
            )
            alert.addAction(cancelAction)
            alert.view.setNeedsLayout()
            self.presentViewController(alert, animated: true, completion:nil)
        }
        else{
            configureProfileLabel()
        }
    }
    
    func changeprofileImage(){
        if UserDefaultSurpport.profileImage === nil{
            
        }
        else{
            let fetchResult: PHFetchResult = PHAsset.fetchAssetsWithALAssetURLs([UserDefaultSurpport.profileImage!], options: nil)
            
            if fetchResult.firstObject != nil{
                let asset: PHAsset = fetchResult.firstObject as! PHAsset
                let manager = PHImageManager.defaultManager()
                manager.requestImageForAsset(asset, targetSize: CGSize(width: 140, height: 140), contentMode: .AspectFill, options: nil) { (image, info) in
                    // imageをセットする
                    if image !== nil {
                        self.profileImageView.image = image
                    }
                }
            }
        }
    }
    
    func configureProfileLabel(){
        if UserDefaultSurpport.userName == nil{
            //textの表示はalertのみ。ActionSheetだとtextfiledを表示させようとすると
            //落ちます。
            let alert:UIAlertController = UIAlertController(title:"はじめましょう！！",
                                                            message: "ユーザー名を入力してください",
                                                            preferredStyle: UIAlertControllerStyle.Alert)
            
            let defaultAction:UIAlertAction = UIAlertAction(title: "OK",
                                                            style: UIAlertActionStyle.Default,
                                                            handler:{
                                                                (action:UIAlertAction!) -> Void in
                                                                let textFields:Array<UITextField>? =  alert.textFields as Array<UITextField>?
                                                                if textFields != nil {
                                                                    for textField:UITextField in textFields! {
                                                                        //各textにアクセス
                                                                        if textField.text == ""{
                                                                            textField.text = "ゲスト"
                                                                        }
                                                                        UserDefaultSurpport.userName = textField.text
                                                                        self.userNameLabel.text = textField.text
                                                                        self.userPointLabel.text = String(UserDefaultSurpport.userPoint)
                                                                        self.userTitleLabel.text = UserDefaultSurpport.userTitle
                                                                        self.navigationController?.visibleViewController?.navigationItem.title = "ホーム"
                                                                        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HiraKakuProN-W6", size: 14)!]
                                                                    }
                                                                }
            })
            alert.addAction(defaultAction)
            
            //textfiledの追加
            alert.addTextFieldWithConfigurationHandler({(text:UITextField!) -> Void in
            })
            alert.view.setNeedsLayout()
            self.presentViewController(alert, animated:true, completion: nil)
        }else{
            userPointLabel.text = String(UserDefaultSurpport.userPoint)
            userTitleLabel.text = UserDefaultSurpport.userTitle
            self.userNameLabel.text = UserDefaultSurpport.userName
        }
    }
    
    @IBAction func onTapEditButton(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            // フォトライブラリの画像・写真選択画面を表示
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .PhotoLibrary
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    
    //MARK: - tableViewDelegate
    
    var sections = ["基本パック", "特殊パック"] // セクション名を格納しておく
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sections[section]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{return self.basicPacks.count;}
        if section == 1{return self.supportPacks.count;}
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        if(indexPath.section == 0){
            let pack:Pack = self.basicPacks[indexPath.row]
            cell.textLabel?.text = pack.name
        }
        if(indexPath.section == 1){
            let pack:Pack = self.supportPacks[indexPath.row]
            cell.textLabel?.text = pack.name        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let contentsTableviewController:ContentsTableViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("ContentsTableViewController")) as! ContentsTableViewController
        
        var pack:Pack!
        if(indexPath.section == 0){
            pack = self.basicPacks[indexPath.row]
        }else{
            pack = self.supportPacks[indexPath.row]
        }
        contentsTableviewController.pack = pack;
        
        self.navigationController?.pushViewController(contentsTableviewController, animated: true);
    }
    
    //この関数内でセクションの設定を行う
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label : UILabel = UILabel()
        label.backgroundColor = UIColor(red:0/256, green:0/256, blue:0/256, alpha:0.1)
        label.textColor = UIColor.whiteColor()
        if(section == 0){
            label.text = sections[section]
        } else if (section == 1){
            label.text = sections[section]
        }
        return label
    }
    
    //MARK : - UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        // 選択した画像・写真を取得し、imageViewに表示
        if let info = editingInfo, let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            profileImageView.image = editedImage
        }else{
            profileImageView.image = image
        }
        
        changeprofileImage()
        // フォトライブラリの画像・写真選択画面を閉じる
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        if info[UIImagePickerControllerOriginalImage] != nil {
            // 画像のパスを取得
            let imageUrl = info[UIImagePickerControllerReferenceURL] as? NSURL
            UserDefaultSurpport.profileImage = imageUrl!
        }
        
        changeprofileImage()
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
}
