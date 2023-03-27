//
//  SearchViewModel.swift
//  Weather
//
//  Created by manish yadav on 3/24/23.
//

import Foundation

class SearchViewModel {
    private var dataSource = [SearchModel]()
    /// To update UI on successful response
    var updateUI: (() -> ())?
    var showError: (() -> ())?
    let searchDataManager: SearchDataManager
    init(searchDataManager: SearchDataManager) {
        self.searchDataManager = searchDataManager
    }
    func searchRequest(searchString: String) -> RequestManager {
        return RequestManager.fetchCity(searchString)
    }
    func search(searchRequest: RequestManager) {
        Task {
            do {
                let result = try await self.searchDataManager.search(request: searchRequest)
                switch result {
                case .success(let dataModel):
                    self.dataSource.append(dataModel)
                    self.updateUI?()
                case .failure(let error):
                    debugPrint("Error:\(error)")
                    self.showError?()
                }
            } catch(let error) {
                debugPrint("Error:\(error)")
                self.showError?()
            }
        }
    }
    private func getSearchedRecords() {
        
    }
    /// Return ModelObject for index
    /// - Parameter index: row index of cell
    /// - Returns: Model object to be populated
    func itemAtIndexPath(index: Int) -> SearchModel? {
        return self.dataSource[index]
    }
    /// Return number of records for table
    func numberOfRows() -> Int {
        return self.dataSource.count
    }
}
