//
//  RealmManager.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 05.04.2022.
//

import Foundation
import RealmSwift

class RealmManager {
    
    private func createRealm() -> Realm {
        var realm: Realm {
            do {
                let realm = try Realm()
                return realm
            } catch {
                let error = NSError()
                print(error)
            }
            return realm
        }
        return realm
    }
    
    func saveMovies(objects: [MovieRealmModel]) {
        print(Realm.bund)
        let realm = createRealm()
        do {
            try objects.forEach { object in
                try realm.write {
                    realm.add(object, update: .modified)
                }
            }
        } catch {
            let error = NSError()
            print(error)
        }
    }
    
    func loadMovies() -> ([MovieRealmModel]?, Error?) {
        let realm = createRealm()
         var movies = Array(realm.objects(MovieRealmModel.self))
         if  !movies.isEmpty {
             movies = movies.sorted { $0.id < $1.id}
             return (movies, nil)
         } else {
             let error = NSError()
             return (nil, error)
         }
    }
}
