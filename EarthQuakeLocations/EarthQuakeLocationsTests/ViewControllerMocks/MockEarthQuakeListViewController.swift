//
//  MockEarthQuakeListViewController.swift
//  EarthQuakeLocationsTests
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation
import XCTest
@testable import EarthQuakeLocations

class MockEarthQuakeListViewController: EarthQuakeListViewModelDelegate {
    var updateListCalled: Bool = false
    var updateListCalledCount: Int = 0
    func updateList() {
        updateListCalled = true
        updateListCalledCount = updateListCalledCount + 1
    }
    
    var showErrorCalled: Bool = false
    var showErrorCalledCount: Int = 0
    func showError(error: StringError) {
        showErrorCalled = true
        showErrorCalledCount = showErrorCalledCount + 1
    }
}

