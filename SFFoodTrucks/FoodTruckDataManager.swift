//
//  FoodTruckDataManager.swift
//  SFFoodTrucks
//
//  Created by Singam, Venkata Srinath Mith on 7/3/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

class FoodTruckDataManager {
    
    static var shared: FoodTruckDataManager = FoodTruckDataManager()
    private var allFoodTrucks: [FoodTrucksInfo]? = nil
    private init() {}
    
    func setAllFoodTrucks(_ openFoodTrucks:[FoodTrucksInfo]?){
        self.allFoodTrucks = openFoodTrucks
    }
    
    func getOpenFoodTrucks()->[FoodTrucksInfo]?{
        
        let openFoodTrucks = allFoodTrucks?.filter({isFoodTruckOpenNow(dayOfWeek:$0.dayorder,
                                                                openTime: $0.start24,
                                                                closingTime: $0.end24)})
        
        return openFoodTrucks
    }
    
    private func isFoodTruckOpenNow(dayOfWeek: String? ,openTime : String?, closingTime : String?) -> Bool {
        
        guard let dayOfWeekStr = dayOfWeek, let dayNumber = Int(dayOfWeekStr) else {return false}
        guard let openTimeStr = openTime else {return false}
        guard let closingTimeStr = closingTime else {return false}
        
        let date = Date()
        let calendar = NSCalendar.current
        let currentHour = calendar.component(.hour, from: date)
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
