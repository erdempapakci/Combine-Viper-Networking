//
//  NetworkManagerProtocol.swift
//  Viper_Combine_SampleApp
//
//  Created by Erdem Papakçı on 17.07.2023.
//

import Foundation
import Combine


protocol NetworkManagerProtocol  {
    func get<T> (
        type: T.Type,
        router: URLRouter,
        parameters: [String: Any]?,
        headers: [String: String]?,
        count: Int,
        method: RequestMethod
    ) -> AnyPublisher<T, Error> where T: Decodable
    
    func buildRequest(
        router: URLRouter,
        parameters: [String: Any]?,
        headers: [String: String]?,
        count: Int,
        method: RequestMethod
  
    )  -> URLRequest?
}
