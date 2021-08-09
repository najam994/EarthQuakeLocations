//
//  MockEarthQuakeListViewModelService.swift
//  EarthQuakeLocationsTests
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation
import XCTest
@testable import EarthQuakeLocations

class MockEarthQuakeListService: EarthQuakeApi {
    
    var shouldReturnList: Bool = false
    var shouldReturnError: Bool = false
    
    func getEarthQuakeList(completionHandler: @escaping (Result<[EarthQuakeItem], StringError>) -> Void) {
        if shouldReturnList {
            let itemsObject = try! JSONDecoder().decode([String: [EarthQuakeItem]].self, from: data)
            completionHandler(.success(itemsObject["earthquakes"] ?? []))
        }
        if shouldReturnError {
            completionHandler(.failure(StringError.init("Some Pretty Erro", "Some Suggestion", type: .REFRESH)))
        }
    }
    
    private let data = """
        {"earthquakes": [
          {
            "datetime": "2011-03-11 04:46:23",
            "depth": 24.4,
            "lng": 142.369,
            "src": "us",
            "eqid": "c0001xgp",
            "magnitude": 8.8,
            "lat": 38.322
          },
          {
            "datetime": "2012-04-11 06:38:37",
            "depth": 22.9,
            "lng": 93.0632,
            "src": "us",
            "eqid": "c000905e",
            "magnitude": 8.6,
            "lat": 2.311
          },
          {
            "datetime": "2007-09-12 09:10:26",
            "depth": 30,
            "lng": 101.3815,
            "src": "us",
            "eqid": "2007hear",
            "magnitude": 8.4,
            "lat": -4.5172
          },
          {
            "datetime": "2012-04-11 08:43:09",
            "depth": 16.4,
            "lng": 92.4522,
            "src": "us",
            "eqid": "c00090da",
            "magnitude": 8.2,
            "lat": 0.7731
          },
          {
            "datetime": "2019-05-26 07:41:44",
            "depth": 109.88,
            "lng": -75.2975,
            "src": "us",
            "eqid": "us60003sc0",
            "magnitude": 8,
            "lat": -5.796
          },
          {
            "datetime": "2007-04-01 18:39:56",
            "depth": 10,
            "lng": 156.9567,
            "src": "us",
            "eqid": "2007aqbk",
            "magnitude": 8,
            "lat": -8.4528
          },
          {
            "datetime": "2015-04-25 06:13:40",
            "depth": 15,
            "lng": 84.6493,
            "src": "us",
            "eqid": "us20002926",
            "magnitude": 7.9,
            "lat": 28.1306
          },
          {
            "datetime": "2017-01-22 04:32:20",
            "depth": 136,
            "lng": 155.1224,
            "src": "us",
            "eqid": "us10007uph",
            "magnitude": 7.9,
            "lat": -6.2137
          },
          {
            "datetime": "2016-12-17 11:00:30",
            "depth": 103.19,
            "lng": 153.4495,
            "src": "us",
            "eqid": "us200081v8",
            "magnitude": 7.9,
            "lat": -4.5091
          },
          {
            "datetime": "2016-04-17 00:02:40",
            "depth": 19.16,
            "lng": -79.9398,
            "src": "us",
            "eqid": "us20005j32",
            "magnitude": 7.8,
            "lat": 0.3715
          }
        ]}
        """.data(using: .utf8)!
}
