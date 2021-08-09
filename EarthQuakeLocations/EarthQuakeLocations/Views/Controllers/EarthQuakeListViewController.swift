//
//  MapListViewController.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 07/08/2021.
//

import UIKit

class EarthQuakeListViewController: UITableViewController {

    let events = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
}


///// Tableview Delegate methods
//extension EarthQuakeListViewController{
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        print("item tapped at row:", indexPath.row, "in section:", indexPath.section)
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "MapViewController")
//        showDetailViewController(vc, sender: nil)
//    }
//}

/// Tableview Data source methods
extension EarthQuakeListViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count//self.forcastList[section].times.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EarthQuakeItemCell", for: indexPath) as! EarthQuakeItemCell

        //cell.configureCell(time: self.forcastList[indexPath.section].times[indexPath.row])
        //cell.selectionStyle = .none
        cell.textLabel?.text = events[indexPath.row]

        return cell
    }
}

//class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.delegate = self
//        preferredDisplayMode = UISplitViewController.DisplayMode.oneBesideSecondary
//        preferredSplitBehavior = .tile
//    }
//
////    func splitViewController(_ svc: UISplitViewController, shouldHide vc: UIViewController, in orientation: UIInterfaceOrientation) -> Bool {
////        return true
////    }
////
////    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool
////
////    {
////        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
////        guard let topAsDetailController = secondaryAsNavController.topViewController as? EarthQuakeListViewController else { return false }
////        if topAsDetailController.selectedEvent == nil {
////            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
////            return true
////        }
////        return false
////    }
//}
