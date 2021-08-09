//
//  StringTests.swift
//  EarthQuakeLocationsTests
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation
import XCTest
@testable import EarthQuakeLocations

class StringTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func test_shouldReturnCorrectStringFormat() {
        // given
        let date = Date.init(timeIntervalSinceReferenceDate: 321511583.0)
        
        // when
        let calculatedString = date.toString()
        let expectedString = "4:46 AM Friday, Mar 11, 2011"
        
        // then
        XCTAssertEqual(calculatedString, expectedString)
    }
}

