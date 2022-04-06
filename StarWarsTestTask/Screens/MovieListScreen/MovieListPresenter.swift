//
//  MovieListPresenter.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 04.04.2022.
//

import Foundation

protocol MovieListPresenterProtocol: AnyObject {
    init(view: MovieListViewProtocol, interactor: MovieListInteractorProtocol, router: MainRouterProtocol)
    func getMovies()
    func goToPersonsScreen()
}

final class MovieListPresenter: MovieListPresenterProtocol {
    
    private let view: MovieListViewProtocol?
    private let interactor: MovieListInteractorProtocol?
    private let router: MainRouterProtocol?
    private var movies: [MovieModel]?
    
    init(view: MovieListViewProtocol, interactor: MovieListInteractorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func getMovies() {
        interactor?.getMovies(completion: { movies, error in
            if let movies = movies {
                self.movies = movies
                self.view?.updateView(movieList: movies)
            }
        })
    }
    
    func goToPersonsScreen() {
        router?.goToPersonsList()
    }
}
