//
//  Date.swift
//  SFFoodTrucks
//
//  Created by Singam, Venkata Srinath Mith on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import Foundation

extension Date {
    func dayNumberOfWeek() -> Int! {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
