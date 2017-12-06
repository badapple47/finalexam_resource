//
//  ViewController.swift
//  week7_Map
//
//  Created by Pongdec><MacBook on 11/9/17.
//  Copyright © 2017 Pongdec><MacBook. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    func addPinToMap() {
        let Location = CLLocationCoordinate2DMake(13.7958237,100.3256665 )
        let annotation = MapMaker(coordinate: Location, title: "EGCO Department", subtitle: "Phuthamonthon Salaya")
//                let Location = CLLocationCoordinate2DMake(13.765184,100.538322 )
//                let annotation = MapMaker(coordinate: Location, title: "Victory Monument", subtitle: "Phays Thai Road")

        mapView.addAnnotation(annotation)
        setCenterOfMapToLocation(location: Location)
        
    }
    func addPinToMap1() {
        let Location = CLLocationCoordinate2DMake(13.7942321,100.3254753 )
        let annotation = MapMaker(coordinate: Location, title: "ตึกอธิการ", subtitle: "OP Building")
        mapView.addAnnotation(annotation)
        setCenterOfMapToLocation(location: Location)
        
    }
    
    func setCenterOfMapToLocation(location:CLLocationCoordinate2D){
        let Coordinate = CLLocationCoordinate2DMake(location.latitude, location.longitude)
        let Region = MKCoordinateRegion(center:Coordinate, span: MKCoordinateSpan(latitudeDelta:0.01,longitudeDelta: 0.01))
        mapView.setRegion(Region, animated: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPinToMap()
        addPinToMap1()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

