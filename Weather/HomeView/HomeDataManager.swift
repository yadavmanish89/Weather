//
//  HomeDataManager.swift
//  Weather
//
//  Created by manish yadav on 3/26/23.
//

import Foundation

class HomeDataManager {
    private let network: Networking
    init(network: Networking) {
        self.network = network
    }
    func fetchWeather(latLongRequest: RequestProtocol) async throws -> Result<SearchModel, NetworkError> {
        guard let url = latLongRequest.url,
              let data = try await network.request(url: url) else {
            return .failure(.invalidResponse)
        }
        guard let dataModel = JsonParser.getModelFor(data: data, model: SearchModel.self) else {
            return .failure(.parsingError)
            // some changes
        }
        return .success(dataModel)
    }
    private func getSearchedRecords() -> [SearchModel] {
        
        return []
    }
}
