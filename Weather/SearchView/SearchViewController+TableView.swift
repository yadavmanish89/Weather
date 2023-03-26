//
//  SearchViewController+TableView.swift+TableView.swift
//  Weather
//
//  Created by manish yadav on 3/24/23.
//

import Foundation
import UIKit

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        cell.dataModel = self.viewModel.itemAtIndexPath(index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedModel = self.viewModel.itemAtIndexPath(index: indexPath.row) {

        }
    }
}
