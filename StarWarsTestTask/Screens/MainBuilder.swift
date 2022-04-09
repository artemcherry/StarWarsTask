//
//  MainBuilder.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 04.04.2022.
//

import Foundation
import UIKit

protocol MainBuilderProtocol: AnyObject {
    func createMovieListScreen(router: MainRouterProtocol) -> UIViewController?
    func createPersonsListScreen(router: MainRouterProtocol, persons: [PersonModel], movieName: String) -> UIViewController?
    func createHomePlanetScreen(router: MainRouterProtocol, planet: HomePlanetModel) -> UIViewController?
}

class MainBuilder: MainBuilderProtocol {
    
    func createMovieListScreen(router: MainRouterProtocol) -> UIViewController? {
        let view = MovieListView()
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
    
    func createPersonsListScreen(router: MainRouterProtocol, persons: [PersonModel], movieName: String) -> UIViewController? {
        let view = PersonsListView()
        let interactor = PersonsListInteracor()
        let presenter = PersonsListPresenter(view: view, interactor: interactor, router: router, persons: persons, movieName: movieName)
        view.presenter = presenter
        return view
    }
    
    func createHomePlanetScreen(router: MainRouterProtocol, planet: HomePlanetModel) -> UIViewController? {
        let view = HomePlanetView()
        let presenter = HomePlanetPresenter(view: view, router: router, planet: planet)
        view.presenter = presenter
        return view
    }
}
