//
//  PersonsListPresenter.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 06.04.2022.
//

import Foundation

protocol PersonsListPresenterProtocol: AnyObject {
    init(view: PersonsListViewProtocol, interactor: PersonsListInteracorProtocol, router: MainRouterProtocol)
}

class PersonsListPresenter: PersonsListPresenterProtocol {
    
    private let view: PersonsListViewProtocol?
    private let interactor: PersonsListInteracorProtocol?
    private let router: MainRouterProtocol?
    
    required init(view: PersonsListViewProtocol, interactor: PersonsListInteracorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
