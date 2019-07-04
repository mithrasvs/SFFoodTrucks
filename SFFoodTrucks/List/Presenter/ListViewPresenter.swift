//
//  ListViewPresenter.swift
//  SFFoodTrucks
//
//  Created by Mithra Singam on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import UIKit

class ListViewPresenter: NSObject {
    
    private let foodTruckDataManager = FoodTruckDataManager.shared
    
    func getFoodTrucksList(didSuccess completion: @escaping(String?)->(),
                           didFail fail: @escaping(String)->()){
        
        let getFoodTrucksList = GetFoodTrucksList()
        getFoodTrucksList.getFoodTrucksList(didSuccess: { [weak self] foodTrucksList in
            guard let self = self else {return}
            if foodTrucksList.count == 0{
                completion("Couldn't load Food Trucks data. Please try again some time later")
            }else{
                self.foodTruckDataManager.setAllFoodTrucks(foodTrucksList)
                completion(nil)
            }
        }) { error in
            fail("Something went wrong! Please try again later.")
        }
    }
}

extension ListViewPresenter{
    
    func getNumberOfTableViewRows()->Int{
        guard let count = foodTruckDataManager.getOpenFoodTrucks()?.count else {return 0}
        return count
    }
    
    func getTableViewRowData(forIndex index:Int)->FoodTruckCellData{
        guard let currentTruck = foodTruckDataManager.getOpenFoodTrucks()?[index],
                let startTime = currentTruck.starttime,
                let endTime = currentTruck.endtime else { return FoodTruckCellData()}
        
        let foodTruckCellData = FoodTruckCellData(foodTruckName: currentTruck.applicant, address: currentTruck.address, specialities: currentTruck.optionaltext, timings: startTime + " - " + endTime)
        return foodTruckCellData
    }
    
    
}
