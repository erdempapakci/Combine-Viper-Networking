//
//  StaticJSONMapper.swift
//  Viper_Combine_SampleAppTests
//
//  Created by Erdem Papakçı on 29.07.2023.
//

import Foundation
import Viper_Combine_SampleApp
struct StaticJSONMapper {
    
    static func decode<T: Decodable>(file: String, type: T.Type) throws -> T {
       
        guard !file.isEmpty, let path = Bundle.main.path(forResource: file, ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            throw MappingError.mapError
        }
        let decoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: data)
    }
    
}

extension StaticJSONMapper {
    
    enum MappingError: Error {
        case mapError
    }
    
}
