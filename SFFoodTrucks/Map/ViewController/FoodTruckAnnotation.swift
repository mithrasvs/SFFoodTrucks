//
//  FoodTruckAnnotation.swift
//  SFFoodTrucks
//
//  Created by Singam, Venkata Srinath Mith on 7/3/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import UIKit
import MapKit

class FoodTruckAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var foodTruckInfo : FoodTrucksInfo
    
    init(coordinate : CLLocationCoordinate2D, foodTruckInfo : FoodTrucksInfo){
        self.coordinate = coordinate
        self.foodTruckInfo = foodTruckInfo
    }
}
