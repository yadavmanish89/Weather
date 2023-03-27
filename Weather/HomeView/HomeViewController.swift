//
//  HomeViewController.swift
//  Weather
//
//  Created by manish yadav on 3/25/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    let network = Network()
    var viewModel: HomeViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViewModel()
        self.fetchWeather()
        self.addRightBarButton()
    }
    func addRightBarButton() {
        let search = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonAction))

        navigationItem.rightBarButtonItem = search
    }
    @objc func searchButtonAction() {
        let stb = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let searchViewController = stb.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController {
            searchViewController.viewModel = SearchViewModel(searchDataManager: SearchDataManager(network: network))
            self.navigationController?.showDetailViewController(searchViewController, sender: self)
        }
    }
    func fetchWeather() {
        self.viewModel.latLongRequest { [weak self] request in
            self?.viewModel.fetchWeather(latLongRequest: request)
        }
    }
    
    private func initViewModel() {
        self.viewModel = HomeViewModel(searchDataManager: SearchDataManager(network: network))
        self.viewModel.updateUI = {
            DispatchQueue.main.async { [weak self] in
                self?.temperatureLabel.text = "\(self?.viewModel.dataModel?.main.temp ?? 0)"
            }
        }
    }

}
