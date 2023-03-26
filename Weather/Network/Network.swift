//
//  Network.swift
//  Weather
//
//  Created by manish yadav on 3/24/23.
//
import Foundation

class Network: Networking {
    func request(url: URL) async throws -> Data?{
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        return data
    }
}
