//
//  SearchModel.swift
//  Weather
//
//  Created by manish yadav on 3/24/23.
//

import Foundation

struct SearchModel: Codable {
    var weather: [Weather]
    var main: Main
    var base: String
    var name: String
}
struct Weather: Codable {
    var id: Int
    var main: String?
    var description: String?
    var icon: String?
}
struct Main: Codable {
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Int?
    var humidity: Int?
}
/**
 {
     "coord": {
         "lon": -118.2437,
         "lat": 34.0522
     },
     "weather": [
         {
             "id": 800,
             "main": "Clear",
             "description": "clear sky",
             "icon": "01n"
         }
     ],
     "base": "stations",
     "main": {
         "temp": 287.03,
         "feels_like": 285.49,
         "temp_min": 284.37,
         "temp_max": 289.22,
         "pressure": 1021,
         "humidity": 39
     },
     "visibility": 10000,
     "wind": {
         "speed": 6.69,
         "deg": 270
     },
     "clouds": {
         "all": 0
     },
     "dt": 1679799297,
     "sys": {
         "type": 1,
         "id": 3694,
         "country": "US",
         "sunrise": 1679752198,
         "sunset": 1679796470
     },
     "timezone": -25200,
     "id": 5368361,
     "name": "Los Angeles",
     "cod": 200
 }
 */
