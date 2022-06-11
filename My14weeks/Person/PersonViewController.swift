//
//  PersonViewController.swift
//  My14weeks
//
//  Created by bro on 2022/06/10.
//

import UIKit
import SnapKit

class PersonViewController: UIViewController {

    private var viewModel = PersonViewModel()
    
    fileprivate var tableView = UITableView()
    fileprivate var searchBar = UISearchBar()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        searchBar.delegate = self
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        viewModel.person.bind { person in
            self.tableView.reloadData()
        }
        
    }
    
}

extension PersonViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.fetchPerson(query: searchBar.text!, page: 1)
    }
}

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return viewModel.person.value.results.count
        return viewModel.numberOfRowInsection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        //cell.textLabel?.text = viewModel.person.value.results[indexPath.row].name
        
        let data = viewModel.cellForRowAt(at: indexPath)
        cell.textLabel?.text = "\(data.name) | \(data.knownForDepartment)"
        return cell
    }
    
    
}
