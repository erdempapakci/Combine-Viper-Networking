//
//  MainInteractor.swift
//  Viper_Combine_SampleApp
//
//  Created by Erdem Papakçı on 17.07.2023.
//

import Foundation
import Combine

final class MainInteractor: MainInteractorProtocol {
  
    let service: NetworkManagerProtocol
    
    init(service: NetworkManagerProtocol) {
        self.service = service
        
    }
   
    func fetchData(count: Int) -> AnyPublisher<[Podcast],Error> {

        return self.service.get(type: PodcastResponse.self, router: .podcast, parameters: nil, headers: nil, count: count, method: .get)
            .tryMap({ $0.results ?? []})
            .eraseToAnyPublisher()
            
    }
    
}
