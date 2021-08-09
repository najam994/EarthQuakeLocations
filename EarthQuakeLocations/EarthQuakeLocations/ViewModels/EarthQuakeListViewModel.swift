//
//  EarthQuakeListViewModel.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation
protocol EarthQuakeListViewModelDelegate {
    func updateList()
    func showError(error: StringError)
}

class EarthQuakeListViewModel {
    
    let service = EarthQuakeListService()
    var earthQuakeItems = [EarthQuakeItem]()
    var delegate: EarthQuakeListViewModelDelegate?
    
    func getEarthQuakeList() {
        self.service.getEarthQuakeList { [unowned self] result in
            switch result {
            case .success(let items):
                self.earthQuakeItems = items
                self.delegate?.updateList()
            case .failure(let error):
                self.delegate?.showError(error: error)
            }
        }
    }
}
