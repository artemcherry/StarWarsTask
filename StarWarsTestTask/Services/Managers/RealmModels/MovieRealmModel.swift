//
//  MovieRealmModel.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 06.04.2022.
//

import Foundation
import RealmSwift

class MovieRealmModel: Object {
    
    @Persisted dynamic var id: Int
    @Persisted var title: String?
    @Persisted var director: String?
    @Persisted var producer: String?
    @Persisted var releaseDate: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: Int, title: String, director: String, producer: String, releaseDate: String) {
        self.init()
        self.id = id
        self.title = title
        self.director = director
        self.producer = producer
        self.releaseDate = releaseDate
    }
}
