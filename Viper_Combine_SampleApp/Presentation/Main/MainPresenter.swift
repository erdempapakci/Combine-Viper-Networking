//
//  MainPresenter.swift
//  Viper_Combine_SampleApp
//
//  Created by Erdem Papakçı on 17.07.2023.
//
import Foundation
import Combine

final class MainPresenter: MainPresenterProtocol, ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
   
    private unowned let view: MainViewProtocol
    
    var router: MainRouterProtocol
    var interactor: MainInteractorProtocol
    init(view: MainViewProtocol, router: MainRouterProtocol, interactor: MainInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    @Published var podcasts: [Podcast] = []
    
    func cellForRowAt(_ index: Int) -> Podcast {
        return podcasts[index]
    }

   
    func numberOfRows() -> Int {
       
        return podcasts.count
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
                self?.podcasts = users
                self?.view.reloadData()
            }
            .store(in: &cancellables)

    }
 
}


