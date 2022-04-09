//
//  HomePlanetModel.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 09.04.2022.
//

import Foundation

struct HomePlanetList: Codable {
    let results: [HomePlanetModel]?
}

struct HomePlanetModel: Codable {
    let name: String?
    let diameter: String?
    let climate: String?
    let gravity: String?
    let terrain: String?
    let population: String?
}
