//
//  LocationDetails.swift
//  SFFoodTrucks
//
//  Created by Mithra Singam on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import Foundation
struct LocationDetails : Codable {
	let latitude : String?
	let longitude : String?
	let humanAddress : String?

	enum CodingKeys: String, CodingKey {
		case latitude = "latitude"
		case longitude = "longitude"
		case humanAddress = "human_address"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
		longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
		humanAddress = try values.decodeIfPresent(String.self, forKey: .humanAddress)
	}

}
