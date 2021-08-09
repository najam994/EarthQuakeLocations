//
//  EarthQuakeItem.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation

class EarthQuakeItem: Decodable {
    
    var datetime: String
    var depth: Double
    var lng: Double
    var src: String
    var eqid: String
    var magnitude: Double
    var lat: Double
    
    internal init(datetime: String, depth: Double, lng: Double, src: String, eqid: String, magnitude: Double, lat: Double) {
        self.datetime = datetime
        self.depth = depth
        self.lng = lng
        self.src = src
        self.eqid = eqid
        self.magnitude = magnitude
        self.lat = lat
    }
}
