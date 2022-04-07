//
//  DataService.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 05.04.2022.
//

import Foundation

class DataService {
    
    private let networkManager = NetworkManager()
    
    func getMovies(completion: @escaping ([MovieModel]?, Error?) -> Void) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self = self else { return }
            self.networkManager.getMovies { movies, error in
                if error != nil {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                } else {
                    DispatchQueue.main.async {
                        let sortedMovieList = movies?.results?.sorted(by: {$0.episodeID < $1.episodeID})
                        completion(sortedMovieList, nil)
                    }
                }
            }
        }
    }
    
    func getPersons(completion: @escaping ([PersonModel]?, Error?) -> Void) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self = self else { return }
            self.networkManager.getPersons { personList, error in
                if error == nil {
                    let persons = personList?.results
                    completion(persons, error)
                } else {
                    completion(nil, error)
                }
            }
        }
    }
}
