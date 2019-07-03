/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Json4Swift_Base : Codable {
	let dayorder : String?
	let dayofweekstr : String?
	let starttime : String?
	let endtime : String?
	let permit : String?
	let location : String?
	let locationdesc : String?
	let optionaltext : String?
	let locationid : String?
	let start24 : String?
	let end24 : String?
	let cnn : String?
	let addr_date_create : String?
	let addr_date_modified : String?
	let block : String?
	let lot : String?
	let coldtruck : String?
	let applicant : String?
	let x : String?
	let y : String?
	let latitude : String?
	let longitude : String?
	let location_2 : Location_2?

	enum CodingKeys: String, CodingKey {

		case dayorder = "dayorder"
		case dayofweekstr = "dayofweekstr"
		case starttime = "starttime"
		case endtime = "endtime"
		case permit = "permit"
		case location = "location"
		case locationdesc = "locationdesc"
		case optionaltext = "optionaltext"
		case locationid = "locationid"
		case start24 = "start24"
		case end24 = "end24"
		case cnn = "cnn"
		case addr_date_create = "addr_date_create"
		case addr_date_modified = "addr_date_modified"
		case block = "block"
		case lot = "lot"
		case coldtruck = "coldtruck"
		case applicant = "applicant"
		case x = "x"
		case y = "y"
		case latitude = "latitude"
		case longitude = "longitude"
		case location_2 = "location_2"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		dayorder = try values.decodeIfPresent(String.self, forKey: .dayorder)
		dayofweekstr = try values.decodeIfPresent(String.self, forKey: .dayofweekstr)
		starttime = try values.decodeIfPresent(String.self, forKey: .starttime)
		endtime = try values.decodeIfPresent(String.self, forKey: .endtime)
		permit = try values.decodeIfPresent(String.self, forKey: .permit)
		location = try values.decodeIfPresent(String.self, forKey: .location)
		locationdesc = try values.decodeIfPresent(String.self, forKey: .locationdesc)
		optionaltext = try values.decodeIfPresent(String.self, forKey: .optionaltext)
		locationid = try values.decodeIfPresent(String.self, forKey: .locationid)
		start24 = try values.decodeIfPresent(String.self, forKey: .start24)
		end24 = try values.decodeIfPresent(String.self, forKey: .end24)
		cnn = try values.decodeIfPresent(String.self, forKey: .cnn)
		addr_date_create = try values.decodeIfPresent(String.self, forKey: .addr_date_create)
		addr_date_modified = try values.decodeIfPresent(String.self, forKey: .addr_date_modified)
		block = try values.decodeIfPresent(String.self, forKey: .block)
		lot = try values.decodeIfPresent(String.self, forKey: .lot)
		coldtruck = try values.decodeIfPresent(String.self, forKey: .coldtruck)
		applicant = try values.decodeIfPresent(String.self, forKey: .applicant)
		x = try values.decodeIfPresent(String.self, forKey: .x)
		y = try values.decodeIfPresent(String.self, forKey: .y)
		latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
		longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
		location_2 = try values.decodeIfPresent(Location_2.self, forKey: .location_2)
	}

}
