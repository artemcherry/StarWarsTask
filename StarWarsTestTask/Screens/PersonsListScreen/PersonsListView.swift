//
//  PersonsListView.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 06.04.2022.
//

import UIKit

protocol PersonsListViewProtocol: AnyObject {}

class PersonsListView: UIViewController, PersonsListViewProtocol {
    
    var presenter: PersonsListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
