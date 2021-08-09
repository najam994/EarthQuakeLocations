//
//  DateTests.swift
//  EarthQuakeLocationsTests
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation
import XCTest
@testable import EarthQuakeLocations

class DateTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func test_shouldReturnCorrectdateFormat() {
        // given
        let dateInString = "2011-03-11 04:46:23"
        
        // when
        let calculatedDate = dateInString.toDate()
        let expectedDate = Date.init(timeIntervalSinceReferenceDate: 321511583.0)
        
        // then
        XCTAssertEqual(calculatedDate, expectedDate)
    }
}
