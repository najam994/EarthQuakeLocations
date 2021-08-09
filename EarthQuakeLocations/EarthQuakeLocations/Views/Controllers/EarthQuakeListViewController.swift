//
//  MapListViewController.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 07/08/2021.
//

import UIKit

class EarthQuakeListViewController: UITableViewController {
    
    ///Variables
    let viewModel = EarthQuakeListViewModel()
    var loadingView: UIView?
    
    //MARK: - Life Cycle Functions
    override func viewDidLoad() {
        
        self.viewModel.delegate = self
        self.loadList()
        self.addRefreshControl()
    }
    
    //MARK: - Custom Functions
    func addRefreshControl() {
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
    }
    
    /// Setup
    func loadList() {
        self.showActivityIndicator(shouldShow: true)
        self.viewModel.getEarthQuakeList()
    }
    
    @objc func refreshList() {
        self.showActivityIndicator(shouldShow: false)
        self.viewModel.getEarthQuakeList()
    }
    
    /// Shows activity indicator in middle of screen
    /// - Parameter shouldShow: boolean value, which determines that should we add or remove activity indicator
    func showActivityIndicator(shouldShow: Bool) {
        if(shouldShow){
            self.loadingView = self.addLoadingView(onView: self.view)
        }else{
            self.removeLoadingView(vSpinner: self.loadingView)
            self.loadingView = nil      //To release memory
        }
    }
}

// MARK: Delegates
/// EarthQuakeListViewModelDelegate methods
extension EarthQuakeListViewController: EarthQuakeListViewModelDelegate{
    func updateList() {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
            self.showActivityIndicator(shouldShow: false)
            self.tableView.reloadData()
        }
    }
    
    func showError(error: StringError) {
        DispatchQueue.main.async {
            self.presentErrorAlert(error: error) {
                self.tableView.refreshControl?.endRefreshing()
                self.showActivityIndicator(shouldShow: false)
                self.loadList()
            }
        }
    }
}

/// Tableview Delegate methods
extension EarthQuakeListViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("item tapped at row:", indexPath.row, "in section:", indexPath.section)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MapViewController")
        showDetailViewController(vc, sender: nil)
    }
}

/// Tableview Data source methods
extension EarthQuakeListViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.earthQuakeItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EarthQuakeItemCell", for: indexPath) as! EarthQuakeItemCell
        
        cell.configureCell(earthQuakeItem: self.viewModel.earthQuakeItems[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
}
