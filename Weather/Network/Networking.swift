//
//  Networking.swift
//  Weather
//
//  Created by manish yadav on 3/24/23.
//

import Foundation

protocol Networking {
    func request(url: URL) async throws -> Data?
}
