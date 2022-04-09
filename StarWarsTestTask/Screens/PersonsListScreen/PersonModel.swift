//
//  PersonModel.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 06.04.2022.
//

import Foundation

struct PersonList: Codable {
    let results: [PersonModel]
}

struct PersonModel: Codable {
    let name: String?
    let gender: String?
    let dateOfBirth: String?
    let films: [String]?
    let homeWorld: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case dateOfBirth = "birth_year"
        case films
        case homeWorld = "homeworld"
    }
}
