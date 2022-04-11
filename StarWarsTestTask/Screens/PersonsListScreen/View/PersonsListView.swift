//
//  PersonsListView.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 06.04.2022.
//

import UIKit

protocol PersonsListViewProtocol: AnyObject {
    func setupView(persons: [PersonModel], movieName: String)
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
    private var personList = [PersonModel]()
    private var movieName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        

        personsTable.delegate = self
        personsTable.dataSource = self
        
        presenter?.getPersonsList()
        
    }
    
    func setupView(persons: [PersonModel], movieName: String) {
        self.personList.append(contentsOf: persons)
        self.title = movieName
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
        personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonListCell.identifier, for: indexPath) as? PersonListCell
       
        else { return UITableViewCell() }
        cell.setupCell(model: personList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let home = HomePlanetModel(name: "", diameter: "", climate: "", gravity: "", terrain: "", population: "")
        presenter?.goToHomePlanetScreen(planet: home)
    }
  
    //MARK: - Pagination
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.contentOffset.y >= (personsTable.contentSize.height - scrollView.frame.size.height )) {
            self.presenter?.getMorePersons()
        }
    }
}
