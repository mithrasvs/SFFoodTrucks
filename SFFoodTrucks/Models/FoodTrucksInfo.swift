//
//  FoodTrucksInfo.swift
//  SFFoodTrucks
//
//  Created by Mithra Singam on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import Foundation
struct FoodTrucksInfo : Codable {
    
	let dayorder : String?
	let starttime : String?
	let endtime : String?
	let address : String?
	let optionaltext : String?
	let start24 : String?
	let end24 : String?
	let applicant : String?
	let latitude : Double?
	let longitude : Double?
	let location : LocationDetails?

	enum CodingKeys: String, CodingKey {
		case dayorder = "dayorder"
		case starttime = "starttime"
		case endtime = "endtime"
		case address = "location"
		case optionaltext = "optionaltext"
		case start24 = "start24"
		case end24 = "end24"
		case applicant = "applicant"
		case latitude = "latitude"
		case longitude = "longitude"
		case location = "location_2"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		dayorder = try values.decodeIfPresent(String.self, forKey: .dayorder)
		starttime = try values.decodeIfPresent(String.self, forKey: .starttime)
		endtime = try values.decodeIfPresent(String.self, forKey: .endtime)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		optionaltext = try values.decodeIfPresent(String.self, forKey: .optionaltext)
		start24 = try values.decodeIfPresent(String.self, forKey: .start24)
		end24 = try values.decodeIfPresent(String.self, forKey: .end24)
		applicant = try values.decodeIfPresent(String.self, forKey: .applicant)
        if let latitudeStr = try values.decodeIfPresent(String.self, forKey: .latitude){
            latitude = Double(latitudeStr)
        }else{
            latitude = nil
        }
        if let longitudeStr = try values.decodeIfPresent(String.self, forKey: .longitude){
            longitude = Double(longitudeStr)
        }else{
            longitude = nil
        }
        location = try values.decodeIfPresent(LocationDetails.self, forKey: .location)
	}

}
