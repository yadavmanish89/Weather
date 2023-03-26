//
//  RequestManager.swift
//  Weather
//
//  Created by manish yadav on 3/24/23.
//

import Foundation

enum RequestManager: RequestProtocol {
    case search(String)
    
    var url: URL? {
        switch self {
        case .search(_):
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
        case .search(let searchString):
            let params = ["appid": ApiConstant.apiKey,
                          "q": searchString,
                        ]
            return params
        }
    }
}
