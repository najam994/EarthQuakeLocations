//
//  UIView.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 09/08/2021.
//

import UIKit

extension UIView {
    
    func addShadow(){
        // border radius
        self.layer.cornerRadius = 16.0;

        // border
        self.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        self.layer.borderWidth = 2.0;

        // drop shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 1.0
        self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
    }
}
