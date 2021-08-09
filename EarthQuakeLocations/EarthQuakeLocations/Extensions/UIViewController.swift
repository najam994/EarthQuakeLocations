//
//  UIViewController.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentErrorAlert(error: StringError, completion: @escaping () -> Void) {
        let message = (error.errorDescription ?? "") + "\n" + (error.recoverySuggestion ?? "")
        let alertController = UIAlertController(title: "Alert", message: message , preferredStyle: .alert)
        
        switch error.alertType {
        case .REFRESH:
            alertController.addAction(UIAlertAction.init(title: "Refresh", style: .default, handler: { (action) in
                completion()
            }))
            alertController.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        case .MESSAGE:
            alertController.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func presentGeneralErrorMessage(error: Error) {
        let alertController = UIAlertController(title: "Alert", message: error.localizedDescription , preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func addLoadingView(onView : UIView) -> UIView {
        let loaderView = UIView.init(frame: onView.bounds)
        loaderView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.15)
        let indicator = UIActivityIndicatorView.init(style: .medium)
        indicator.color = .black
        indicator.startAnimating()
        indicator.center = loaderView.center
        loaderView.addSubview(indicator)
        onView.addSubview(loaderView)
        return loaderView
    }
    
    func removeLoadingView(vSpinner : UIView?) {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
        }
    }
}



