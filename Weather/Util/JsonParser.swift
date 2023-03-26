//
//  JsonParser.swift
//  Weather
//
//  Created by manish yadav on 3/24/23.
//

import Foundation

class JsonParser {
    static func getModelFor<T>(data: Data, model: T.Type) -> T? where T: (Decodable) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            return try jsonDecoder.decode(T.self, from: data)
        } catch(let err) {
            debugPrint("Errow while parsing:\(err.localizedDescription)")
        }
        return nil
    }
}
