//
//  NetworkManager.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 05.04.2022.
//

import Foundation

class NetworkManager {
    
    private var personPage = 1
    
    func getMovies(completion: @escaping (MovieList?, Error?) -> Void) {
        let stringUrl = "https://swapi.dev/api/films/?format=json"
        guard let url = URL(string: stringUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                guard let parcedData = try? JSONDecoder().decode(MovieList.self, from: data) else {
                    completion(nil, error)
                   return
                     }
                completion(parcedData, nil)
            }
        }
            task.resume()
    }
    
    func getPersons(completion: @escaping (PersonList?, Error?) -> Void) {
        let stringUrl = "https://swapi.dev/api/people/?page=\(personPage)&format=json"
        guard let url = URL(string: stringUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                guard let parcedData = try? JSONDecoder().decode(PersonList.self, from: data)  else {
                    completion(nil, error)
                    return
                }
                completion(parcedData, nil)
            }
        }
        task.resume()
        self.personPage += 1
    }
}
