//
//  NetworkManager.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init(){}
    
    func getRequest(url: String, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
    
        ///Cannot do a singleton pattern here, due to some weird error in Queues if user connect and disconnect again and again, then it won't call closure
        Connectivity().checkInternetConnection(){ isConnected in
            if(!isConnected){
                completionHandler(.failure(.NO_INTERNET))
                return
            }
            
            guard let url = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
                completionHandler(.failure(.BAD_URL))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

                guard let data = data, error == nil else {
                    //If server failed and sends error
                    completionHandler(.failure(.UNEXPECTED(code: 403, description: error?.localizedDescription ?? "Server internal error")))
                    return
                }
                completionHandler(.success(data))
            }
            task.resume()
        }
    }
}

