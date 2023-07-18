//
//  API.swift
//  Viper_Combine_SampleApp
//
//  Created by Erdem Papakçı on 17.07.2023.
//

import Foundation
import Combine

final class NetworkManager: NetworkManagerProtocol {
    
    func get<T> (
        type: T.Type,
        router: URLRouter,
        parameters: [String: Any]? = nil,
        headers: [String: String]? = nil,
        count: Int,
        method: RequestMethod
    ) -> AnyPublisher<T, Error> where T: Decodable {
        
        if let request = buildRequest(router: router, count: count) {
            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap(\.data)
                .decode(type: T.self, decoder: Decoders.Decoder)
                .eraseToAnyPublisher()
        }
       
        return Fail(error: NSError(domain: "Server Error", code: 0))
            .eraseToAnyPublisher()
        
    }
    
    func buildRequest(
        router: URLRouter,
        parameters: [String: Any]? = nil,
        headers: [String: String]? = nil,
        count: Int,
        method: RequestMethod = .get
  
    )  -> URLRequest? {
        
        let locale = Locale.current
        guard let countryCode = locale.language.region?.identifier.lowercased() else {
                return nil
            }

        let urlString = Constant.scheme + Constant.baseURL + countryCode + "/podcasts/top/\(count)/" + router.path
        guard let url = URL(string: urlString) else { return nil  }
        
         var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let requestHeaders = headers {
            for (field, value) in requestHeaders {
                request.setValue(value, forHTTPHeaderField: field)
            }
        }
        
        return request
    }
}
