//
//  LocationManager.swift
//  Weather
//
//  Created by manish yadav on 3/26/23.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, CLLocationManagerDelegate {
    var locationPublisher = PassthroughSubject<(Double, Double), Error>()
    private override init() {
        super.init()
    }
    static let shared = LocationManager()

    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        return manager
    }()

    func getLocation() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
        default:
            debugPrint("\(#line):default")
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        debugPrint("\(#line):Location ChangeAuthorization:\(manager.location?.coordinate.latitude)")
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.requestLocation()
        default:
            debugPrint("\(#line):default")
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        debugPrint("\(#line):Location")
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            self.locationPublisher.send((latitude, longitude))
            debugPrint("\(#line):Location didUpdateLocations:\(latitude), \(longitude)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint("\(#line):Location didFailWithError")
    }
}
