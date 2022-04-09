//
//  HomePlanetView.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 09.04.2022.
//

import UIKit

protocol HomePlanetViewProtocol: AnyObject {}

class HomePlanetView: UIViewController, HomePlanetViewProtocol {
    
    var presenter: HomePlanetPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
