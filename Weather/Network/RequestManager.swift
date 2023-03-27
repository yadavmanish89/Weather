//
//  RequestManager.swift
//  Weather
//
//  Created by manish yadav on 3/24/23.
//

import Foundation

enum RequestManager: RequestProtocol {
    case fetchCity(String)
    case fetchLatLong(Double, Double)

    var url: URL? {
        switch self {
        case .fetchCity(_):
            var urlComponents = URLComponents(string: ApiConstant.baseURL +
                                              ApiConstant.weatherAPI)
            if let parameters {
                urlComponents?.queryItems = parameters.map {
                    URLQueryItem(name: $0, value: $1)
                }
            }
            return urlComponents?.url
        case .fetchLatLong(_, _):
            var urlComponents = URLComponents(string: ApiConstant.baseURL +
                                              ApiConstant.weatherAPI)
            if let parameters {
                urlComponents?.queryItems = parameters.map {
                    URLQueryItem(name: $0, value: $1)
                }
            }
            return urlComponents?.url
        }
    }
    
    var parameters: RequestParameters? {
        switch self {
        case .fetchCity(let searchString):
            let params = ["appid": ApiConstant.apiKey,
                          "q": searchString,
                        ]
            return params
        case .fetchLatLong(let lat, let long):
            let params = ["appid": ApiConstant.apiKey,
                          "lat": "\(lat)",
                          "lon": "\(long)"
                        ]
            return params
        }
    }
}
