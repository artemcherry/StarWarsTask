//
//  DataService.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 05.04.2022.
//

import Foundation

class DataService {
    
    private let networkManager = NetworkManager()
    private let realmManager = RealmManager()
    
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
                        let movieData = self.transformMovieToData(movies: sortedMovieList ?? [])
                        self.realmManager.saveMovies(objects: movieData)
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
    
    
    
    private func transformDataToMovieModel(movieData: [MovieRealmModel]) -> [MovieModel] {
        var movies = [MovieModel]()
        movieData.forEach { movieData in
            movies.append(MovieModel(title: movieData.title,
                                     episodeID: movieData.id,
                                     director: movieData.director,
                                     producer: movieData.producer,
                                     releaseDate: movieData.releaseDate,
                                     url: movieData.url))
        }
        return movies
    }
    
    private func transformMovieToData(movies: [MovieModel]) -> [MovieRealmModel] {
        var movieData = [MovieRealmModel]()
        movies.forEach { movie in
            movieData.append(MovieRealmModel(id: movie.episodeID,
                                             title: movie.title ?? "",
                                             director: movie.director ?? "",
                                             producer: movie.producer ?? "",
                                             releaseDate: movie.releaseDate ?? "",
                                             url: movie.url ?? ""))
        }
        return movieData
    }
}
