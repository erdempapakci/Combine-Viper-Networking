//
//  PodcastResponse.swift
//  Viper_Combine_SampleApp
//
//  Created by Erdem Papakçı on 17.07.2023.
//

import Foundation
struct PodcastResponse: Decodable {
  
    enum RootCodingKeys: String, CodingKey {
       case feed
   }
   
    enum FeedCodingKeys: String, CodingKey {
       case results
   }
   let results: [Podcast]?
   
   public init(from decoder: Decoder) throws {
       let values = try decoder.container(keyedBy: RootCodingKeys.self)
       let feedContainer = try values.nestedContainer(keyedBy: FeedCodingKeys.self, forKey: .feed)
     
       results = try feedContainer.decodeIfPresent([Podcast].self, forKey: .results)
       
   }
   
   
}
