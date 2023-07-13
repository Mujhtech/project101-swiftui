//
//  StaticJsonMapper.swift
//  Project101
//
//  Created by Muhideen Mujeeb Adeoye on 14/07/2023.
//

import Foundation

struct StaticJsonMapper {
    static func decode<T: Decodable>(file: String, type: T.Type) throws -> T {
        guard let path = Bundle.main.path(forResource: file, ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            throw MappingError.failedToGetContents
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
}


extension StaticJsonMapper {
    enum MappingError: Error {
        case failedToGetContents
    }
}
