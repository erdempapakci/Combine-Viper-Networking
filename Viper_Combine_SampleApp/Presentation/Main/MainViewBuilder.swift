//
//  MainViewBuilder.swift
//  Viper_Combine_SampleApp
//
//  Created by Erdem Papakçı on 17.07.2023.
//

import UIKit

final class MainViewBuilder {
    
    static func build() -> MainViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "MainViewController") as! MainViewController
        let router = MainRouter(view: view)
        
        let interactor = MainInteractor(service: app.service)
        
        let presenter = MainPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}
