//
//  NetworkError.swift
//  Weather
//
//  Created by manish yadav on 3/24/23.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .parsingError:
            return "Parsing Error"
        case .invalidResponse:
            return "Bad Response from server"
        case .emptyValues:
            return "No value Found"
        }
    }
    case invalidURL, parsingError, invalidResponse, emptyValues
}
