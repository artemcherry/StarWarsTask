//
//  HomePlanetPresenter.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 09.04.2022.
//

import Foundation

protocol HomePlanetPresenterProtocol: AnyObject {
    init(view: HomePlanetViewProtocol, router: MainRouterProtocol, planet: HomePlanetModel)
}

class HomePlanetPresenter: HomePlanetPresenterProtocol {
    
    private let view: HomePlanetViewProtocol?
    private let planet: HomePlanetModel?
    private let router: MainRouterProtocol?
    
    required init(view: HomePlanetViewProtocol, router: MainRouterProtocol, planet: HomePlanetModel) {
        self.view = view
        self.router = router
        self.planet = planet
    }
}
