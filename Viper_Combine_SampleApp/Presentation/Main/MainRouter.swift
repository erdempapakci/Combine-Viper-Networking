//
//  MainRouter.swift
//  Viper_Combine_SampleApp
//
//  Created by Erdem Papakçı on 17.07.2023.
//

import UIKit

protocol MainRouterProtocol {
  
}

final class MainRouter: MainRouterProtocol {
    unowned let view: UIViewController
    init(view: UIViewController) {
        self.view = view
    }
    
}
