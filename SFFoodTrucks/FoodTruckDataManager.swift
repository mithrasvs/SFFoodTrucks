//
//  FoodTruckDataManager.swift
//  SFFoodTrucks
//
//  Created by Singam, Venkata Srinath Mith on 7/3/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

class FoodTruckDataManager {
    
    static var shared: FoodTruckDataManager = FoodTruckDataManager()
    
    private var openFoodTrucks: [FoodTrucksInfo]? = nil
    private init() {}
    
    func setOpenFoodTrucks(_ openFoodTrucks:[FoodTrucksInfo]?){
        self.openFoodTrucks = openFoodTrucks
    }
    
    func getOpenFoodTrucks()->[FoodTrucksInfo]?{
        return openFoodTrucks
    }

}
