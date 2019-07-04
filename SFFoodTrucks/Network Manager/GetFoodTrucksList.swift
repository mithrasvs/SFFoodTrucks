//
//  GetFoodTrucksList.swift
//  SFFoodTrucks
//
//  Created by Singam, Venkata Srinath Mith on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//
import Foundation

struct GetFoodTrucksList {

    public func getFoodTrucksList(didSuccess success: @escaping ([FoodTrucksInfo])->(),
                               didFailure failure:@escaping (Error)->()){
        let urlString = "https://data.sfgov.org/resource/jjew-r69b.json"
        AFHTTPSessionManager().get(urlString,
                                   parameters: nil,
                                   headers: nil,
                                   progress: nil,
                                   success: { (URLSessionDataTask, responseObject:Any) in
                                    do{
                                        let jsonResponse = try JSONSerialization.data(withJSONObject: responseObject as Any, options: JSONSerialization.WritingOptions.sortedKeys)
                                        let foodTrucksList = try JSONDecoder().decode([FoodTrucksInfo].self, from: jsonResponse)
                                        success(foodTrucksList)
                                    } catch let error as NSError {
                                        print("Failed to load: \(error.localizedDescription)")
                                    } catch let parsingError {
                                        print("Error", parsingError)
                                    }
        }) { (URLSessionDataTask, error : Error) in
            
            failure(error)
        }
        
    }
    
    
}
