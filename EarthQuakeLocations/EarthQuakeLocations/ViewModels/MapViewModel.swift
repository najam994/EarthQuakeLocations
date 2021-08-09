//
//  MapViewModel.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation
import MapKit

class MapViewModel {
    
    func getAnnotation(lat: Double, lng: Double) -> MKAnnotation {
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "Earth Quake"
        annotation.subtitle = "Origin of Earth Quake..."
        annotation.coordinate = .init(latitude: CLLocationDegrees.init(lat), longitude: CLLocationDegrees.init(lng))
        
        return annotation
    }
    
    func getRegion(lat: Double, lng: Double) -> MKCoordinateRegion {
        return MKCoordinateRegion(center: .init(latitude: CLLocationDegrees.init(lat), longitude: CLLocationDegrees.init(lng)), latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
}
