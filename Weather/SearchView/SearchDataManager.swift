//
//  SearchDataManager.swift
//  Weather
//
//  Created by manish yadav on 3/24/23.
//

import Foundation

protocol SearchNetworkProtocol {
    func search(request: RequestProtocol) async throws -> Result<SearchModel, NetworkError>
}

class SearchDataManager {
    private let network: Networking
    init(network: Networking) {
        self.network = network
    }
    func search(request: RequestProtocol) async throws -> Result<SearchModel, NetworkError> {
         
        guard let url = request.url,
              let data = try await network.request(url: url) else {
            return .failure(.invalidResponse)
        }
        guard let dataModel = JsonParser.getModelFor(data: data, model: SearchModel.self) else {
            return .failure(.parsingError)
        }
        return .success(dataModel)
    }
    private func getSearchedRecords() -> [SearchModel] {
        
        return []
    }
}
