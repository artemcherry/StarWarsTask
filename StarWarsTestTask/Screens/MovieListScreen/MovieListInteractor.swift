//
//  MovieListInteractor.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 04.04.2022.
//

import Foundation

protocol MovieListInteractorProtocol: AnyObject {
    func getMovies(completion: @escaping ([MovieModel]?, Error?) -> Void)
    func getPersons(completion: @escaping ([PersonModel]?, Error?) -> Void)
}

final class MovieListInteractor: MovieListInteractorProtocol {
    
    private let dataService = DataService()
    
    func getMovies(completion: @escaping ([MovieModel]?, Error?) -> Void) {
        dataService.getMovies { movies, error in
            if error != nil {
                completion(nil, error)
            } else {
                completion(movies, nil)
            }
        }
    }
    
    func getPersons(completion: @escaping ([PersonModel]?, Error?) -> Void) {
        dataService.getPersons { persons, error in
            if error != nil {
                completion(nil, error)
            } else {
                completion(persons, nil)
            }
        }
    }
}

