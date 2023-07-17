//
//  MainPresenter.swift
//  Viper_Combine_SampleApp
//
//  Created by Erdem Papakçı on 17.07.2023.
//
import Foundation
import Combine

final class MainPresenter: MainPresenterProtocol {
    
    var cancellabes: [AnyCancellable] = []
   
    private unowned let view: MainViewProtocol
    var router: MainRouterProtocol
    var interactor: MainInteractorProtocol
    init(view: MainViewProtocol, router: MainRouterProtocol, interactor: MainInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    var podcats: [Podcast] = []
    
    func cellForRowAt(_ index: Int) -> Podcast {
        return podcats[index]
    }

    
    func didSelectRow(_ index: Int) {
        
    }
   
    func numberOfRows() -> Int {
       
        return podcats.count
    }
  
    func viewDidLoad() {
        view.configureTableView()
    
    }
    func load(count: Int) {
        
       interactor.fetchData(count: count)
            
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] users in
                self?.podcats = users
                self?.view.reloadData()
            }
            .store(in: &cancellabes)

    }
 
 
}


