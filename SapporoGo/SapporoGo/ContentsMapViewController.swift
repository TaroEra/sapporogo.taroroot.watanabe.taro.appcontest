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
        
        initalizeRealmObject()
        addAnotations()
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
    
    func createMapObjectValue(let sectionItem:NSArray) -> NSDictionary{
        
        let array = sectionItem
        
        let id:Int = array[0].integerValue
        let type = array[1]
        let name = array[2]
        let latitude = array[3].doubleValue
        let longitude = array[4].doubleValue
        let fileName = contentsItem?.fileName
        
        var address = "北海道"
        address = address.stringByAppendingString(array[7] as! String)
        address = address.stringByAppendingString(array[6] as! String)
        address = address.stringByAppendingString(array[5] as! String)
        
        let addressNumber = array[8]
        let phoneNumber = array[9]
        let faxNumber = array[10]
        
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
    
    //MARK: - MapViewDelegate
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        if mapView.region.span.latitudeDelta < 0.3
        {
            print("create annotations")
            addAnotations()
        }else
        {
            print("remove annotations")
            mapView.removeAnnotations(self.mapView.annotations)
        }
    }
}
