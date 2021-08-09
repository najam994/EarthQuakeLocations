//
//  Connectivity.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation
import Network

/// Check for internet connection, if it is available or not, we must have to create new instance always because with singleton it won't work again again,
/// at some point it won't return into closure, maybe because of queue system etc.
class Connectivity {
    
    let monitor = NWPathMonitor()
    
    init(){
        self.startMonitoring()
    }
    
    func checkInternetConnection(completionHandler: @escaping (Bool) -> Void)  {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied && !path.isExpensive {
                completionHandler(true)
            } else {
                completionHandler(false)
            }
        }
    }
    
    func startMonitoring() {
        let queue = DispatchQueue(label: QueueNames.MONITOR.rawValue)
        monitor.start(queue: queue)
    }
    
    func stopMonitoing() {
        monitor.cancel()
    }
    
    deinit {
        self.stopMonitoing()
    }
}
