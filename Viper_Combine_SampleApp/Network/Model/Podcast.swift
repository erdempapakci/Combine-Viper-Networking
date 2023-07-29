//
//  Podcast.swift
//  Viper_Combine_SampleApp
//
//  Created by Erdem Papakçı on 17.07.2023.
//

import Foundation

struct Podcast: Decodable, Equatable {
    
    let artistName: String
    let id: String
    let name: String
    let image: String
    let rating: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case id = "id"
        case name = "name"
        case image = "artworkUrl100"
        case rating = "contentAdvisoryRating"
    }
}
