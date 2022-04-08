//
//  PersonsListInteracor.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 06.04.2022.
//

import Foundation

protocol PersonsListInteracorProtocol: AnyObject {
    func getMorePersons(completion: @escaping ([PersonModel]?, Error?) -> Void)
}

class PersonsListInteracor: PersonsListInteracorProtocol {
    
    private let dataService = DataService()
    
    func getMorePersons(completion: @escaping([PersonModel]?, Error?) -> Void) {
        dataService.getPersons { persons, error in
            if let persons = persons {
                completion(persons, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
