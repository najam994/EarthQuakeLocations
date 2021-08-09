//
//  EarthQuakeListViewModelService.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation

class EarthQuakeListService: EarthQuakeApi {
    
    func getEarthQuakeList(completionHandler: @escaping (Result<[EarthQuakeItem], StringError>) -> Void) {
        
        let url = RestApiUrls.baseUrl.rawValue + "?formatted=true&north=44.1&south=-9.9&east=-22.4&west=55.2&username=mkoppelman"
        
        NetworkManager.shared.getRequest(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let itemsObject = try JSONDecoder().decode([String: [EarthQuakeItem]].self, from: data)
                    completionHandler(.success(itemsObject["earthquakes"] ?? []))
                } catch {
                    //If server sends some unexpected error then auto parsing will fail and this fail
                    completionHandler(.failure(ErrorManager.shared.getError(error: .PARSE_ERROR)))
                }
            case .failure(let error):
                completionHandler(.failure(ErrorManager.shared.getError(error: error)))
            }
        }
    }
}
