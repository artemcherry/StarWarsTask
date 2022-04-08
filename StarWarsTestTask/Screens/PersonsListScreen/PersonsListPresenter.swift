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
         persons: [PersonModel],
         movieName: String)
    func getPersonsList()
    func getMorePersons()
}

class PersonsListPresenter: PersonsListPresenterProtocol {
    
    private let view: PersonsListViewProtocol?
    private let interactor: PersonsListInteracorProtocol?
    private let router: MainRouterProtocol?
    private var persons: [PersonModel]?
    private let movieName: String?
    
    required init(view: PersonsListViewProtocol,
                  interactor: PersonsListInteracorProtocol,
                  router: MainRouterProtocol,
                  persons: [PersonModel],
                  movieName: String) {
        
        self.view = view
        self.interactor = interactor
        self.router = router
        self.persons = persons
        self.movieName = movieName
    }
    
    func getPersonsList() {
        guard let persons = persons,
              let movieName = movieName
        else { return }
        self.view?.setupView(persons: persons, movieName: movieName)
    }
    
    func getMorePersons() {
        interactor?.getMorePersons(completion: { persons, error in
            if let persons = persons  {
                guard let movieName = self.movieName else { return }
                self.persons?.append(contentsOf: persons)
                self.view?.setupView(persons: persons, movieName: movieName)
            }
        })
    }
}
