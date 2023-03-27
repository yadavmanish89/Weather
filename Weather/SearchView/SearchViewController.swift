//
//  SearchViewController.swift
//  Weather
//
//  Created by manish yadav on 3/24/23.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var cityTableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var viewModel = SearchViewModel(
        searchDataManager: SearchDataManager(network: Network())
        )

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        searhCity()
        self.cityTableView.tableHeaderView = self.searchController.searchBar
        LocationManagerService.shared.getLocation {latitude, logitude in
            print("lat long\(latitude)")

        }
    }
    private func bindViewModel() {
        self.viewModel.updateUI = {
            DispatchQueue.main.async { [weak self] in
                self?.cityTableView.reloadData()
            }
        }
        self.viewModel.showError = {
            DispatchQueue.main.async { [weak self] in
//                print("Show Error")
            }
        }
    }
    func searhCity() {
        let request = self.viewModel.searchRequest(searchString: "Bellevue")
        self.viewModel.search(searchRequest: request)
    }
}
