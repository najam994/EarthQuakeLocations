//
//  MapView.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 07/08/2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    ///Variables
    var earthQuakeItem: EarthQuakeItem?
    let viewModel = MapViewModel()
    
    //MARK: - Life Cycle Functions
    override func viewDidLoad() {
    }
    
    //MARK: - Custom Functions
    func setLocationOnMap() {
        self.loadViewIfNeeded()
        self.mapView.addAnnotation(self.viewModel.getAnnotation(lat: self.earthQuakeItem?.lat ?? 0.0, lng: self.earthQuakeItem?.lng ?? 0.0))
        self.mapView.setRegion(self.viewModel.getRegion(lat: self.earthQuakeItem?.lat ?? 0.0, lng: self.earthQuakeItem?.lng ?? 0.0), animated: true)
    }
}

extension MapViewController: EarthQuakeItemSelectedDelegate {
    func itemSelected(earthQuakeItem: EarthQuakeItem) {
        self.earthQuakeItem = earthQuakeItem
        self.title = earthQuakeItem.eqid
        self.setLocationOnMap()
    }
}
