//
//  MainContracts.swift
//  Viper_Combine_SampleApp
//
//  Created by Erdem Papakçı on 17.07.2023.
//

import Foundation
import Combine

// View

protocol MainViewProtocol: AnyObject {
    func configureTableView()
    func reloadData()
}

// Presenter


protocol MainPresenterProtocol {
    func cellForRowAt(_ index: Int) -> Podcast
    func numberOfRows() -> Int
    func didSelectRow(_ index: Int)
    func viewDidLoad()
    func load(count: Int)
    
    
}

// Interactor

protocol MainInteractorProtocol {
    
    func fetchData(count: Int) -> AnyPublisher<[Podcast],Error>
}


