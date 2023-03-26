//
//  RequestProtocol.swift
//  Weather
//
//  Created by manish yadav on 3/24/23.
//

import Foundation

protocol RequestProtocol {
    typealias RequestParameters = [String : String]
    var url: URL? { get }
    var parameters: RequestParameters? { get }
}
