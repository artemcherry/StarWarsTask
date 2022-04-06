//
//  PersonsListView.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 06.04.2022.
//

import UIKit

protocol PersonsListViewProtocol: AnyObject {}

class PersonsListView: UIViewController, PersonsListViewProtocol {
    
    private let personsTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = .systemBackground
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var presenter: PersonsListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

        personsTable.delegate = self
        personsTable.dataSource = self
        
    }
    
    private func setupView() {
        
        view.addSubview(personsTable)
        
        NSLayoutConstraint.activate([
            personsTable.topAnchor.constraint(equalTo: view.topAnchor),
            personsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            personsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            personsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

extension PersonsListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Pagination
    }
}
