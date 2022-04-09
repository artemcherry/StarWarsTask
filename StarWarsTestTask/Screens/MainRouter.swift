//
//  MainRouter.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 04.04.2022.
//

import Foundation
import UIKit

protocol MainRouterProtocol {
    var mainBuilder: MainBuilderProtocol? { get set }
    init(builder: MainBuilderProtocol)
    func goToPersonsList(persons: [PersonModel], movieName: String)
    func goToHomePlanetScreen(planet: HomePlanetModel)
}

class MainRouter: MainRouterProtocol {
    
    var mainBuilder: MainBuilderProtocol?
    var navigationController: UINavigationController?
    
    required init(builder: MainBuilderProtocol) {
        self.mainBuilder = builder
    }
    
    func goToPersonsList(persons: [PersonModel], movieName: String) {
        guard let personsScreen = mainBuilder?.createPersonsListScreen(router: self, persons: persons, movieName: movieName) as? PersonsListView else { return }
        self.navigationController?.pushViewController(personsScreen, animated: true)
    }
    
    func goToHomePlanetScreen(planet: HomePlanetModel) {
        guard let homePlanetScreen = mainBuilder?.createHomePlanetScreen(router: self, planet: planet) else { return }
        self.navigationController?.pushViewController(homePlanetScreen, animated: true)
    }
}
