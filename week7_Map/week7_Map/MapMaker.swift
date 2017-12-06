//
//  MapMaker.swift
//  week7_Map
//
//  Created by Pongdec><MacBook on 11/9/17.
//  Copyright © 2017 Pongdec><MacBook. All rights reserved.
//

import Foundation
import MapKit

class MapMaker: NSObject , MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    //ค่า coordinate
    var title: String?
    //ค่า title
    var subtitle: String?
    //ค่า subtitle
    
    //set init ก่อน
    init(coordinate: CLLocationCoordinate2D,title:String,subtitle:String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        super.init()
    }
}
