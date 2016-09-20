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

class ContentsMapViewController: UIViewController, MKMapViewDelegate {
    
    var contentsItem:ContentsItem?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        
        let coordinate = CLLocationCoordinate2DMake(43.062096, 141.354376)
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(coordinate, span)
        mapView.setRegion(region, animated:true)
        
        self.mapView.removeAnnotations(self.mapView.annotations)
        
        addAnnotations()
    }
    
    func addAnnotations(){
        
        let realm = try! Realm();
        
        if self.contentsItem?.fileName == "police_station"
        {
            self.configurePoliceStation()
            for policeStation in realm.objects(PoliceStation){
                let annotation:MKPointAnnotation = MKPointAnnotation();
                annotation.coordinate = CLLocationCoordinate2DMake(policeStation.latitude, policeStation.longitude);
                annotation.title = policeStation.name;
                annotation.subtitle = policeStation.address;
                self.mapView .addAnnotation(annotation)
            }
        }
        else if self.contentsItem?.fileName == "nursing_home"
        {
            self.configureNursingHome()
            for nursingHome in realm.objects(NursingHome){
                let annotation:MKPointAnnotation = MKPointAnnotation();
                annotation.coordinate = CLLocationCoordinate2DMake(nursingHome.latitude, nursingHome.longitude);
                annotation.title = nursingHome.name;
                annotation.subtitle = nursingHome.address;
                self.mapView .addAnnotation(annotation)
            }        }
        else if self.contentsItem?.fileName == "ward_office"
        {
            self.configureWordOffice()
            for wardOffice in realm.objects(WardOffice){
                let annotation:MKPointAnnotation = MKPointAnnotation();
                annotation.coordinate = CLLocationCoordinate2DMake(wardOffice.latitude, wardOffice.longitude);
                annotation.title = wardOffice.name;
                annotation.subtitle = wardOffice.address;
                self.mapView .addAnnotation(annotation)
            }
        }
        else if self.contentsItem?.fileName == "comunity_center"
        {
            self.configureComunityCenter()
            for wardOffice in realm.objects(ComunityCenter){
                let annotation:MKPointAnnotation = MKPointAnnotation();
                annotation.coordinate = CLLocationCoordinate2DMake(wardOffice.latitude, wardOffice.longitude);
                annotation.title = wardOffice.name;
                annotation.subtitle = wardOffice.address;
                self.mapView .addAnnotation(annotation)
            }
        }
        else if self.contentsItem?.fileName == "insurance_center"
        {
            self.configureIsuranceCenter()
            for insuranceCenter in realm.objects(InsuranceCenter){
                let annotation:MKPointAnnotation = MKPointAnnotation();
                annotation.coordinate = CLLocationCoordinate2DMake(insuranceCenter.latitude, insuranceCenter.longitude);
                annotation.title = insuranceCenter.name;
                annotation.subtitle = insuranceCenter.address;
                self.mapView .addAnnotation(annotation)
            }
        }
        else if self.contentsItem?.fileName == "town_planning_center"
        {
            self.configureTownPlannningCenter()
            for insuranceCenter in realm.objects(TownPlanningCenter){
                let annotation:MKPointAnnotation = MKPointAnnotation();
                annotation.coordinate = CLLocationCoordinate2DMake(insuranceCenter.latitude, insuranceCenter.longitude);
                annotation.title = insuranceCenter.name;
                annotation.subtitle = insuranceCenter.address;
                self.mapView .addAnnotation(annotation)
            }
        }
        else if self.contentsItem?.fileName == "public_works_center"
        {
            self.configurePublicworksCenter()
            for insuranceCenter in realm.objects(PublicworksCenter){
                let annotation:MKPointAnnotation = MKPointAnnotation();
                annotation.coordinate = CLLocationCoordinate2DMake(insuranceCenter.latitude, insuranceCenter.longitude);
                annotation.title = insuranceCenter.name;
                annotation.subtitle = insuranceCenter.address;
                self.mapView .addAnnotation(annotation)
            }
        }
    }
    
    func configurePublicworksCenter(){
        let realm = try! Realm()
        let sections = parseCSV()
        
        for sectionsItem in sections{
            
            let comunityCenter = PublicworksCenter(
                value:createObjectValue(sectionsItem as! NSArray)
            )
            try! realm.write{
                realm.add(comunityCenter, update: true)
            }
        }
    }
    
    func configureTownPlannningCenter(){
        let realm = try! Realm()
        let sections = parseCSV()
        
        for sectionsItem in sections{
            
            let comunityCenter = TownPlanningCenter(
                value:createObjectValue(sectionsItem as! NSArray)
            )
            try! realm.write{
                realm.add(comunityCenter, update: true)
            }
        }
    }
    
    func configureIsuranceCenter(){
        let realm = try! Realm()
        let sections = parseCSV()
        
        for sectionsItem in sections{
            
            let comunityCenter = InsuranceCenter(
                value:createObjectValue(sectionsItem as! NSArray)
            )
            try! realm.write{
                realm.add(comunityCenter, update: true)
            }
        }
    }
    
    func configureComunityCenter(){
        let realm = try! Realm()
        let sections = parseCSV()
        
        for sectionsItem in sections{
            
            let comunityCenter = ComunityCenter(
                value:createObjectValue(sectionsItem as! NSArray)
            )
            try! realm.write{
                realm.add(comunityCenter, update: true)
            }
        }
    }
    
    func configureWordOffice(){
        let realm = try! Realm()
        let sections = parseCSV()
        
        for sectionsItem in sections{
            
            let wardOffice = WardOffice(
                value:createObjectValue(sectionsItem as! NSArray)
            )
            try! realm.write{
                realm.add(wardOffice, update: true)
            }
        }
    }
    
    func configureNursingHome(){
        
        let realm = try! Realm()
        let sections = self.parseCSV()
        
        for sectionsItem in sections{
            
            let nursingHome = NursingHome(
                value:createObjectValue(sectionsItem as! NSArray)
            )
            try! realm.write{
                realm.add(nursingHome, update: true)
            }
        }
    }
    
    func configurePoliceStation(){
        
        let realm = try! Realm()
        let sections = parseCSV()
        
        for sectionsItem in sections{
            
            let policeStation = PoliceStation(
                value:createObjectValue(sectionsItem as! NSArray)
            )
            try! realm.write{
                realm.add(policeStation, update:true)
            }
        }
    }
    
    func createObjectValue(let sectionItem:NSArray) -> NSDictionary{
        
        let array = sectionItem
        let id = array[0]
        let type = array[1]
        let name = array[2]
        let latitude = array[3].doubleValue
        let longitude = array[4].doubleValue
        
        var address = "北海道"
        address = address.stringByAppendingString(array[7] as! String)
        address = address.stringByAppendingString(array[6] as! String)
        address = address.stringByAppendingString(array[5] as! String)
        
        let valule =    ["id":id,
                         "type":type,
                         "name":name,
                         "latitude":latitude,
                         "longitude":longitude,
                         "address":address]
        return valule
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
        sections.removeObjectAtIndex(0)
        return sections
    }
    
    //MARK: - MapViewDelegate
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        if mapView.region.span.latitudeDelta < 0.3
        {
            print("create annotations")
            addAnnotations()
        }else
        {
            print("remove annotations")
            mapView.removeAnnotations(self.mapView.annotations)
        }
    }
}
