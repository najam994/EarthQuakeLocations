//
//  EarthQuakeApi.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation

protocol EarthQuakeApi {

    func getEarthQuakeList(completionHandler: @escaping (Result<[EarthQuakeItem], StringError>) -> Void)
}
