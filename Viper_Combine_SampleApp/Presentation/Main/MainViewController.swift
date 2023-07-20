//
//  MainViewController.swift
//  Viper_Combine_SampleApp
//
//  Created by Erdem Papakçı on 17.07.2023.
//

import UIKit

final class MainViewController: BaseViewController, MainViewProtocol {
   
    var presenter: MainPresenterProtocol!
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        presenter.load(count: 10)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(tableView)
    }
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.frame
    }
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.tableView.reloadData()
        }
    }
    
    
    
}
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = presenter.cellForRowAt(indexPath.row).artistName
       
        return cell
        
    }
    
    
}


