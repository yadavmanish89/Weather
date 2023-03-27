//
//  HomeViewController.swift
//  Weather
//
//  Created by manish yadav on 3/25/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    var viewModel = HomeViewModel(searchDataManager: SearchDataManager(network: Network()))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        self.fetchWeather()
    }
    
    func fetchWeather() {
        self.viewModel.latLongRequest { [weak self] request in
            self?.viewModel.fetchWeather(latLongRequest: request)
        }
    }
    
    private func bindViewModel() {
        self.viewModel.updateUI = {
            DispatchQueue.main.async { [weak self] in
                self?.temperatureLabel.text = "\(self?.viewModel.dataModel?.main.temp ?? 0)"
            }
        }
    }

}
