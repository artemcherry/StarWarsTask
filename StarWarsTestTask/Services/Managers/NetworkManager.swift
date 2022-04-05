//
//  NetworkManager.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 05.04.2022.
//

import Foundation

class NetworkManager {
    
    func getMovies(completion: @escaping (MovieList?, Error?) -> Void) {
        let stringUrl = "https://swapi.dev/api/films/"
        guard let url = URL(string: stringUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                guard let parcedData = try? JSONDecoder().decode(MovieList.self, from: data) else {
                    completion(nil, error)
                    print ("OOPs")
                   return
                     }
                completion(parcedData, nil)
            }
        }
            task.resume()
    }
    
}
