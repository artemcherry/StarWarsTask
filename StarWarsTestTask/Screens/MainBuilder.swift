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
}

class MainBuilder: MainBuilderProtocol {
    
    func createMovieListScreen(router: MainRouterProtocol) -> UIViewController? {
        let view = MovieListView()
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
