//
//  MainRouter.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 04.04.2022.
//

import Foundation
import UIKit

protocol MainRouterProtocol {
    var mainBuilder: MainBuilderProtocol? { get set }
    init(builder: MainBuilderProtocol)
}

class MainRouter: MainRouterProtocol {
    
    var mainBuilder: MainBuilderProtocol?
    var navigationController: UINavigationController?
    
    required init(builder: MainBuilderProtocol) {
        self.mainBuilder = builder
    }
}
