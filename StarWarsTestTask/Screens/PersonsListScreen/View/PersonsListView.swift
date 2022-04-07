//
//  PersonsListView.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 06.04.2022.
//

import UIKit

protocol PersonsListViewProtocol: AnyObject {
    func setupView(persons: [PersonModel])
}

class PersonsListView: UIViewController, PersonsListViewProtocol {
    
    private let personsTable: UITableView = {
        let table = UITableView()
        table.register(PersonListCell.self, forCellReuseIdentifier: PersonListCell.identifier)
        table.backgroundColor = .systemBackground
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var presenter: PersonsListPresenterProtocol?
    private var personList: [PersonModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

        personsTable.delegate = self
        personsTable.dataSource = self
        
    }
    
    func setupView(persons: [PersonModel]) {
        self.personList = persons
        self.personsTable.reloadData()
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

//MARK: - TableViewSetup
extension PersonsListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonListCell.identifier, for: indexPath) as? PersonListCell else { return UITableViewCell() }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Pagination
    }
}
