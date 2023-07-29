//
//  DumpInteractor.swift
//  Viper_Combine_SampleAppTests
//
//  Created by Erdem Papakçı on 29.07.2023.
//

import Foundation
import Combine
@testable import Viper_Combine_SampleApp
final class DumpInteractor: MainInteractorProtocol {
    
   
    private let service: NetworkManagerProtocol = NetworkManager()
    func fetchData(count: Int) -> AnyPublisher<[Podcast], Error> {
        
        return self.service.get(type: PodcastResponse.self, router: .podcast, parameters: nil, headers: nil, count: count, method: .get)
            .tryMap({
                return $0.results ?? []
            })
            .eraseToAnyPublisher()
        
        
    }
    
    
}
