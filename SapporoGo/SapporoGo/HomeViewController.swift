//
//  HomeViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/09.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit
import Photos

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    private var selectedCellTiele:String = ""
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    private var basicPacks:Array<Pack> = []
    private var supportPacks:Array<Pack> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.basicPacks = [AdminPack(), Medicalpack(), FinancialPack(), ResourcePack(), DisasterPack()]
        self.supportPacks = [NursingPack(), ChildcarePack()]
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        changeprofileImage()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false
        self.navigationController?.visibleViewController?.navigationItem.title = "ホーム"
        navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HiraKakuProN-W6", size: 14)!]
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {return "基本パック"}
        if section == 1 {return "特殊パック"}
        return ""
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
        if pack.name == FinancialPack().name{
            contentsTableviewController.pack?.contents = FinancialPack().createContents()
            
        }
        
        self.navigationController?.pushViewController(contentsTableviewController, animated: true);
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