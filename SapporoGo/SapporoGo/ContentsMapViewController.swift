//
//  ContentsMapViewController.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/15.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import UIKit
import RealmSwift
import MapKit
import SafariServices

class ContentsMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var contentsItem:ContentsItem?
    private var locationManager:CLLocationManager!
    @IBOutlet weak var contentsLinkButton: UIButton!
    @IBOutlet weak var sapporoLabel: UILabel!
    @IBOutlet weak var creditImageView: UIImageView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        navigationItem.backBarButtonItem = backButtonItem
        
        if contentsItem?.contentsName == ""{
            contentsLinkButton.hidden = true
            sapporoLabel.hidden = true
            creditImageView.hidden = true
        }else{
            
            self.contentsLinkButton.setTitle(contentsItem!.contentsName, forState: UIControlState.Normal)
        }
        UserDefaultSurpport.userTotalPoint += 1
        UserDefaultSurpport.userPoint += 1
        
        self.view.makeToast("get 1pt", duration: 1.0, position:.Bottom)
        
        self.mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.Follow
        
        let coordinate = CLLocationCoordinate2DMake(43.062096, 141.354376)
        let span = MKCoordinateSpanMake(0.3, 0.3)
        let region = MKCoordinateRegionMake(coordinate, span)
        mapView.setRegion(region, animated:true)
        
        self.mapView.removeAnnotations(self.mapView.annotations)
        
        initalizeRealmObject()
        addAnotations()
        
        //
        //現在地表示処理
        //
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.distanceFilter = 100.0//距離フィルタ
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        // セキュリティ認証のステータスを取得.
        let status = CLLocationManager.authorizationStatus()
        
        // まだ認証が得られていない場合は、認証ダイアログを表示.
        if(status == CLAuthorizationStatus.NotDetermined) {
            
            // まだ承認が得られていない場合は、認証ダイアログを表示.
            locationManager.requestAlwaysAuthorization();
        }
        
        // 位置情報の更新を開始.
        locationManager.startUpdatingLocation()
    }
    
    func initalizeRealmObject(){
        
        let realm = try! Realm()
        
        let sections = CSVParser.parse(self.contentsItem?.fileName)
        for sectionsItem in sections{
            let mapObject = MapObject(value:createMapObjectValue(sectionsItem as! NSArray))
            try! realm.write{
                realm.add(mapObject, update: true)
            }
        }
    }
    
    func addAnotations(){
        let realm = try! Realm();
        
        let query:String! = "file_name = '" + (contentsItem?.fileName)! + "'"
        for mapObject in realm.objects(MapObject).filter(query){
            let annotation:MKPointAnnotation = MKPointAnnotation();
            annotation.coordinate = CLLocationCoordinate2DMake(mapObject.latitude, mapObject.longitude);
            annotation.title = mapObject.name;
            annotation.subtitle = mapObject.address;
            self.mapView .addAnnotation(annotation)
        }
    }
    
    func createMapObjectValue( sectionItem:NSArray) -> NSDictionary{
        
        let array = sectionItem
        
        let id:Int = array[0].integerValue
        let type = array[1]
        let name = array[2]
        let latitude = array[3].doubleValue
        let longitude = array[4].doubleValue
        let fileName = contentsItem?.fileName
        
        var address = "北海道"
        
        let all_address = array[5] as! String
        if all_address.containsString("札幌市"){
            address = address.stringByAppendingString(all_address)
        }
        else if all_address.containsString("区"){
            address = address.stringByAppendingString(array[7] as! String)
            address = address.stringByAppendingString(all_address)
        }
        else{
            address = address.stringByAppendingString(array[7] as! String)
            address = address.stringByAppendingString(array[6] as! String)
            address = address.stringByAppendingString(all_address)
        }
        
        let addressNumber = array[8]
        var phoneNumber = array[9]
        if phoneNumber as! String == " "{
            phoneNumber = "なし"
        }
        
        var faxNumber = array[10]
        if faxNumber as! String == " "{
            faxNumber = "なし"
        }
        
        let valule = ["id":id,
                      "type":type,
                      "name":name,
                      "latitude":latitude,
                      "longitude":longitude,
                      "address":address,
                      "file_name":fileName!,
                      "address_number":addressNumber,
                      "phone_number":phoneNumber,
                      "fax_number":faxNumber]
        return valule
    }
    
    @IBAction func onTapCreditbutton(sender: AnyObject) {
        let safariViewController = SFSafariViewController(URL:NSURL(string:contentsItem!.contentsUrl!)!)
        self.navigationController?.pushViewController(safariViewController, animated: true)
    }
    
    //MARK: - MapViewDelegate
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        if mapView.region.span.latitudeDelta < 0.3
        {
            addAnotations()
        }else
        {
            mapView.removeAnnotations(self.mapView.annotations)
        }
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        
        let reuseIdentifier = "pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseIdentifier)
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation:annotation, reuseIdentifier:reuseIdentifier)
            pinView?.canShowCallout = true
            
            let rightButton: AnyObject! = UIButton(type: UIButtonType.DetailDisclosure)
            pinView?.rightCalloutAccessoryView = rightButton as? UIView
        }else{
            pinView?.annotation = annotation
        }
        return pinView
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print(#function)
        
        let mapObjectTableViewController:MapObjectTableViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("MapObjectTableViewController")) as! MapObjectTableViewController
        
        let defaultRealm = try! Realm()
        let name:String! = view.annotation!.title!
        let mapObject = defaultRealm.objects(MapObject).filter("name == %@", name).first
        mapObjectTableViewController.mapObject = mapObject
        mapObjectTableViewController.navigationItem.title = mapObject?.name
        self.navigationController?.pushViewController(mapObjectTableViewController, animated: true)
    }
    
    //CLLocationManagerDelegate
    // GPSから値を取得した際に呼び出されるメソッド.
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // 配列から現在座標を取得.
        let myLocations: NSArray = locations as NSArray
        let myLastLocation: CLLocation = myLocations.lastObject as! CLLocation
        let myLocation:CLLocationCoordinate2D = myLastLocation.coordinate
        
        // 縮尺.
        let myLatDist : CLLocationDistance = 500
        let myLonDist : CLLocationDistance = 500
        
        // Regionを作成.
        let myRegion: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(myLocation, myLatDist, myLonDist);
        
        // MapViewに反映.
        mapView.setRegion(myRegion, animated: true)
    }
    
    // 認証が変更された時に呼び出されるメソッド.
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status{
        case .AuthorizedWhenInUse:
            //            print("AuthorizedWhenInUse")
            break
        case .Authorized:
            //            print("Authorized")
            break
        case .Denied:
            //            print("Denied")
            break
        case .Restricted:
            //            print("Restricted")
            break
        case .NotDetermined:
            //            print("NotDetermined")
            if locationManager.respondsToSelector(#selector(CLLocationManager.requestWhenInUseAuthorization)) { locationManager.requestWhenInUseAuthorization() }
        }
    }
}
