//
//  MovieModel.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 05.04.2022.
//

import Foundation

struct MovieList: Codable {
    let results: [MovieModel]?
}

struct MovieModel: Codable {
    let title: String?
    let episodeID: Int
    let director: String?
    let producer: String?
    let releaseDate: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case title
        case episodeID = "episode_id"
        case director, producer
        case releaseDate = "release_date"
        case url
    }
}
