//
//  UserDefaultManager.swift
//  Weather
//
//  Created by manish yadav on 3/25/23.
//

import Foundation

class UserDefaultManager {
    func getCityList() -> [String]? {
        return UserDefaults.standard.array(forKey: Constants.userDefaultCityListKey) as? [String]
    }
    
    func saveCity(city: String) {
        var cityArray = getCityList()
        cityArray?.append(city)
        UserDefaults.standard.set(cityArray, forKey: Constants.userDefaultCityListKey)
    }
}
