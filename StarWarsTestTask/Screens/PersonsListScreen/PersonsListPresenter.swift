//
//  PersonsListPresenter.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 06.04.2022.
//

import Foundation

protocol PersonsListPresenterProtocol: AnyObject {
    init(view: PersonsListViewProtocol,
         interactor: PersonsListInteracorProtocol,
         router: MainRouterProtocol,
         persons: [PersonModel])
    func getPersonsList()
}

class PersonsListPresenter: PersonsListPresenterProtocol {
    
    private let view: PersonsListViewProtocol?
    private let interactor: PersonsListInteracorProtocol?
    private let router: MainRouterProtocol?
    private let persons: [PersonModel]?
    
    required init(view: PersonsListViewProtocol,
                  interactor: PersonsListInteracorProtocol,
                  router: MainRouterProtocol,
                  persons: [PersonModel]) {
        
        self.view = view
        self.interactor = interactor
        self.router = router
        self.persons = persons
    }
    
    func getPersonsList() {
        guard let persons = persons else { return }
        view?.setupView(persons: persons)
    }
}
