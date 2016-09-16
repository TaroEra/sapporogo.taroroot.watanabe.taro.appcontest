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

class ContentsMapViewController: UIViewController {
    
    var contentsItem:ContentsItem?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.removeAnnotations(self.mapView.annotations)
        
        let realm = try! Realm();

        if self.contentsItem?.fileName == "police_station"
        {
            self.configurePoliceStation()
            self.addPoliceStationAnnotations(realm)
        }
        
        else if self.contentsItem?.fileName == "nursing_home"
        {
            self.configureNursingHome()
            self.addNursingHomeAnnotations(realm)
        }
    }
    
    func addNursingHomeAnnotations(realm:Realm){
        for nursingHome in realm.objects(NursingHome){
            let annotation:MKPointAnnotation = MKPointAnnotation();
            annotation.coordinate = CLLocationCoordinate2DMake(nursingHome.latitude, nursingHome.longitude);
            annotation.title = nursingHome.name;
            annotation.subtitle = nursingHome.address;
            self.mapView .addAnnotation(annotation)
        }
    }
    
    func configureNursingHome(){
        
        let realm = try! Realm()
        let sections = self.parseCSV()
        
        for sectionsItem in sections{
            let array = sectionsItem as! NSArray
            let name = array[1]
            let address = array[7]
            let latitude = array[3].doubleValue
            let longitude = array[4].doubleValue
            let type = array[8]
            
            let nursingHome = NursingHome(
                value:
                ["name":name,
                    "address":address,
                    "latitude":latitude,
                    "longitude":longitude,
                    "type":type]
            )
            try! realm.write{
                realm.add(nursingHome)
            }
        }
    }
    
    func addPoliceStationAnnotations(realm:Realm){
        for policeStation in realm.objects(PoliceStation){
            let annotation:MKPointAnnotation = MKPointAnnotation();
            annotation.coordinate = CLLocationCoordinate2DMake(policeStation.latitude, policeStation.longitude);
            annotation.title = policeStation.name;
            annotation.subtitle = policeStation.address;
            self.mapView .addAnnotation(annotation)
        }
    }
    
    func configurePoliceStation(){
        
        let realm = try! Realm()
        let sections = self.parseCSV()
        
        for sectionsItem in sections{
            let array = sectionsItem as! NSArray
            let name = array[2]
            var address = "北海道"
            address = address.stringByAppendingString(array[8] as! String)
            address = address.stringByAppendingString(array[7] as! String)
            address = address.stringByAppendingString(array[6] as! String)
            
            let latitude = array[3].doubleValue
            let longitude = array[4].doubleValue
            let type = array[1]
            
            let policeStation = PoliceStation(
                value:
                ["name":name,
                    "address":address,
                    "latitude":latitude,
                    "longitude":longitude,
                    "type":type]
            )
            try! realm.write{
                realm.add(policeStation)
            }
        }
    }
    
    func parseCSV()->NSArray{
        
        let csvFile = NSBundle.mainBundle().pathForResource(self.contentsItem?.fileName, ofType: self.contentsItem?.fileType)
        
        let csvData:NSData?
        do {
            csvData = try NSData(contentsOfFile:csvFile!, options: NSDataReadingOptions.DataReadingMappedAlways)
        }catch{
            csvData = nil
        }
        let csv = String.init(data:csvData!, encoding: NSUTF16StringEncoding)
        let scanner = NSScanner(string: csv!)
        let chSet = NSCharacterSet.newlineCharacterSet()
        let sections = NSMutableArray()
        var line:NSString?
        
        while !scanner.atEnd {
            scanner.scanUpToCharactersFromSet(chSet, intoString: &line)
            let array:NSArray = (line?.componentsSeparatedByString(","))!
            sections .addObject(array)
            scanner.scanCharactersFromSet(chSet, intoString:nil)
        }
        return sections
    }
}
