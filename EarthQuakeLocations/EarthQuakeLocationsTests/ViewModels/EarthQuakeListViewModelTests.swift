//
//  EarthQuakeListViewModelTests.swift
//  EarthQuakeLocationsTests
//
//  Created by Syed Najam on 09/08/2021.
//

import XCTest
@testable import EarthQuakeLocations

class EarthQuakeListViewModelTests: XCTestCase {

    private var viewModel: EarthQuakeListViewModel!
    private var mockService: MockEarthQuakeListService!
    private var viewController: MockEarthQuakeListViewController!
    
    override func setUp() {
        self.mockService = MockEarthQuakeListService()
        self.viewModel = EarthQuakeListViewModel(service: mockService)
        self.viewController = MockEarthQuakeListViewController()
        
    }

    override func tearDown() {
        self.mockService = nil
        self.viewModel = nil
        self.viewController = nil
    }

    func test_ShouldReturnIncorrect() {
        // given
        self.viewModel.delegate = self.viewController
        
        // when
        self.mockService.shouldReturnError = true
        self.viewModel.getEarthQuakeList()
        
        // then
        XCTAssertTrue(self.viewController.showErrorCalled)
        XCTAssertEqual(self.viewController.showErrorCalledCount, 1)
    }
    
    func test_ShouldReturnCorrect() {
        // given
        self.viewModel.delegate = self.viewController
        
        // when
        self.mockService.shouldReturnList = true
        self.viewModel.getEarthQuakeList()
        
        // then
        XCTAssertTrue(self.viewController.updateListCalled)
        XCTAssertEqual(self.viewController.updateListCalledCount, 1)
    }
    
    func test_ShouldContainsNewItems() {
        // given
        //let exp = expectation(description: "wait")
        self.viewModel.delegate = self.viewController
        
        // when
        self.mockService.shouldReturnList = true
        self.viewModel.getEarthQuakeList()
        
        //wait(for: [exp], timeout: 5)
        
        // then
        XCTAssertEqual(self.viewModel.earthQuakeItems.count, 10)
    }
}
