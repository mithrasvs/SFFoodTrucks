//
//  ListViewPresenter.swift
//  SFFoodTrucks
//
//  Created by Mithra Singam on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import UIKit

class ListViewPresenter: NSObject {
    
    private var currentlyOpenTrucks : [FoodTrucksInfo]?
    
    func getFoodTrucksList(didSuccess completion: @escaping(String?)->(),
                           didFail fail: @escaping(String)->()){
        
        let getFoodTrucksList = GetFoodTrucksList()
        
        
        getFoodTrucksList.getFoodTrucksList(didSuccess: { [weak self] foodTrucksList in
            
            guard let self = self else {return}
            
            self.currentlyOpenTrucks = foodTrucksList.filter({self.isFoodTruckOpenNow(dayOfWeek:$0.dayorder,
                                                                                 openTime: $0.start24,
                                                                                 closingTime: $0.end24)})
            if self.currentlyOpenTrucks?.count == 0{
                completion("Couldn't load Food Trucks data. Please try again some time later")
            }else{
                completion(nil)
            }
            
        }) { error in
            fail("Something went wrong! Please try again later.")
        }
        
        
    }
    
    private func isFoodTruckOpenNow(dayOfWeek: String? ,openTime : String?, closingTime : String?) -> Bool {
        
        guard let dayOfWeekStr = dayOfWeek, let dayNumber = Int(dayOfWeekStr) else {return false}
        guard let openTimeStr = openTime else {return false}
        guard let closingTimeStr = closingTime else {return false}
        
        let date = Date()
        let calendar = NSCalendar.current
//        let currentHour = calendar.component(.hour, from: date)
        let currentHour = 6
        let currentMinutes = calendar.component(.minute, from: date)
        let currentTime = (currentHour * 60) + currentMinutes
        
        
        guard let openTimeInMinutes = getTimeInMinutes(openTimeStr) else {return false}
        guard let closingTimeInMinutes = getTimeInMinutes(closingTimeStr) else {return false}
        
        if dayNumber == Date().dayNumberOfWeek(){
            if currentTime >= openTimeInMinutes && currentTime <= closingTimeInMinutes{
                return true
            }
        }
        return false
    }
    
    private func getTimeInMinutes(_ time : String) -> Int?{
        let hourIndex = time.index(time.startIndex, offsetBy: 2)
        let minIndex = time.index(time.endIndex, offsetBy: -2)
        guard let hours = Int(time[..<hourIndex]) else {return nil}
        guard let minutes = Int(time[minIndex...]) else {return nil}
        return (hours*60) + minutes
        
    }
}

extension ListViewPresenter{
    
    func getNumberOfTableViewRows()->Int{
        guard let count = currentlyOpenTrucks?.count else {return 0}
        return count
    }
    
    func getTableViewRowData(forIndex index:Int)->FoodTruckCellData{
        
        guard let currentTruck = currentlyOpenTrucks?[index],
                let startTime = currentTruck.starttime,
                let endTime = currentTruck.endtime else { return FoodTruckCellData()}
        
        let foodTruckCellData = FoodTruckCellData(foodTruckName: currentTruck.applicant, address: currentTruck.address, specialities: currentTruck.optionaltext, timings: startTime + " - " + endTime)
        return foodTruckCellData
    }
    
    
}
