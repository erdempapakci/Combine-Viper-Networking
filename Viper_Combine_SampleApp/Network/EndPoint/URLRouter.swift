//
//  URLRouter.swift
//  Viper_Combine_SampleApp
//
//  Created by Erdem Papakçı on 17.07.2023.
//

import Foundation

enum URLRouter {
    case podcast
    
    var path: String {
        switch self {
        case .podcast:
            return "podcasts.json"
        }
    }
}
