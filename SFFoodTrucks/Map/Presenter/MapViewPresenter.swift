//
//  MapViewPresenter.swift
//  SFFoodTrucks
//
//  Created by Mithra Singam on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import UIKit
import MapKit

class MapViewPresenter {

    var foodTruckAnnotations : [FoodTruckAnnotation] = []
    
    func processFoodTruckAnnotations(){
        guard let openFoodTrucks = FoodTruckDataManager.shared.getOpenFoodTrucks() else {return }
        
        for foodTruck in openFoodTrucks{
            if let latitude = foodTruck.latitude, let longitude = foodTruck.longitude{
                let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                let foodTruckAnnotation = FoodTruckAnnotation(coordinate: location, foodTruckInfo: foodTruck)
                foodTruckAnnotations.append(foodTruckAnnotation)
            }
        }
    }
    
    func getFoodTruckAnnotations()->[FoodTruckAnnotation]{
        return foodTruckAnnotations
    }
}
