//
//  SearchDataManager.swift
//  Weather
//
//  Created by manish yadav on 3/24/23.
//

import Foundation

class SearchDataManager {
    private let network: Networking
    init(network: Networking) {
        self.network = network
    }
    func search(request: RequestProtocol) async throws -> Result<SearchModel, NetworkError> {
         
        guard let url = request.url else {
            return .failure(.invalidURL)
        }
        do {
            if let data = try await network.request(url: url) {
                guard let dataModel = JsonParser.getModelFor(data: data, model: SearchModel.self) else {
                    return .failure(.parsingError)
                }
                return .success(dataModel)
            }
        } catch (let err) {
            debugPrint("err:\(err)")
            return .failure(.parsingError)
        }
        return .failure(.parsingError)
    }
    private func getSearchedRecords() -> [SearchModel] {
        
        return []
    }
}
