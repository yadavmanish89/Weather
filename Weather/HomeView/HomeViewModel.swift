//
//  HomeViewModel.swift
//  Weather
//
//  Created by manish yadav on 3/25/23.
//

import Foundation
import Combine

class HomeViewModel {
    var dataModel: SearchModel?
    /// To update UI on successful response
    var updateUI: (() -> ())?
    var showError: (() -> ())?
    var cancellable: Set<AnyCancellable> = []

    let searchDataManager: SearchDataManager
    init(searchDataManager: SearchDataManager) {
        self.searchDataManager = searchDataManager
    }
    func latLongRequest(completion:@escaping (RequestManager) -> ()) {
        LocationManager.shared.locationPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("Handle \(completion) for error and finished subscription.")
            } receiveValue: { latitude, longitude in
                print("Lat: \(latitude) long:\(longitude).")
                let request = RequestManager.fetchLatLong(latitude, longitude)
                completion(request)
            }
            .store(in: &cancellable)
        LocationManager.shared.getLocation()
    }
    func fetchWeather(latLongRequest: RequestManager) {
        Task {
            do {
                let result = try await self.searchDataManager.search(request: latLongRequest)
                switch result {
                case .success(let dataModel):
                    self.dataModel = dataModel
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
}
