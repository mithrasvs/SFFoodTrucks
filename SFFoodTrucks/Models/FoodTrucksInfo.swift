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
//    let dayofweekstr : String?
	let starttime : String?
	let endtime : String?
//    let permit : String?
	let address : String?
//    let locationdesc : String?
	let optionaltext : String?
//    let locationid : String?
	let start24 : String?
	let end24 : String?
//    let cnn : String?
//    let addr_date_create : String?
//    let addr_date_modified : String?
//    let block : String?
//    let lot : String?
//    let coldtruck : String?
	let applicant : String?
//    let x : String?
//    let y : String?
	let latitude : Double?
	let longitude : Double?
	let location : LocationDetails?

	enum CodingKeys: String, CodingKey {

		case dayorder = "dayorder"
//        case dayofweekstr = "dayofweekstr"
		case starttime = "starttime"
		case endtime = "endtime"
//        case permit = "permit"
		case address = "location"
//        case locationdesc = "locationdesc"
		case optionaltext = "optionaltext"
//        case locationid = "locationid"
		case start24 = "start24"
		case end24 = "end24"
//        case cnn = "cnn"
//        case addr_date_create = "addr_date_create"
//        case addr_date_modified = "addr_date_modified"
//        case block = "block"
//        case lot = "lot"
//        case coldtruck = "coldtruck"
		case applicant = "applicant"
//        case x = "x"
//        case y = "y"
		case latitude = "latitude"
		case longitude = "longitude"
		case location = "location_2"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		dayorder = try values.decodeIfPresent(String.self, forKey: .dayorder)
//        dayofweekstr = try values.decodeIfPresent(String.self, forKey: .dayofweekstr)
		starttime = try values.decodeIfPresent(String.self, forKey: .starttime)
		endtime = try values.decodeIfPresent(String.self, forKey: .endtime)
//        permit = try values.decodeIfPresent(String.self, forKey: .permit)
		address = try values.decodeIfPresent(String.self, forKey: .address)
//        locationdesc = try values.decodeIfPresent(String.self, forKey: .locationdesc)
		optionaltext = try values.decodeIfPresent(String.self, forKey: .optionaltext)
//        locationid = try values.decodeIfPresent(String.self, forKey: .locationid)
		start24 = try values.decodeIfPresent(String.self, forKey: .start24)
		end24 = try values.decodeIfPresent(String.self, forKey: .end24)
//        cnn = try values.decodeIfPresent(String.self, forKey: .cnn)
//        addr_date_create = try values.decodeIfPresent(String.self, forKey: .addr_date_create)
//        addr_date_modified = try values.decodeIfPresent(String.self, forKey: .addr_date_modified)
//        block = try values.decodeIfPresent(String.self, forKey: .block)
//        lot = try values.decodeIfPresent(String.self, forKey: .lot)
//        coldtruck = try values.decodeIfPresent(String.self, forKey: .coldtruck)
		applicant = try values.decodeIfPresent(String.self, forKey: .applicant)
//        x = try values.decodeIfPresent(String.self, forKey: .x)
//        y = try values.decodeIfPresent(String.self, forKey: .y)
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
        
//        longitude = try values.decodeIfPresent(String.self, forKey: .longitude) as? Double
        location = try values.decodeIfPresent(LocationDetails.self, forKey: .location)
	}

}
