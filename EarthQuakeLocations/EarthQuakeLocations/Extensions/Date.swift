//
//  Date.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation

extension Date {
    func toString(withFormat format: String = "h:mm a EEEE, MMM d, yyyy") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let str = dateFormatter.string(from: self)

        return str
    }
}
