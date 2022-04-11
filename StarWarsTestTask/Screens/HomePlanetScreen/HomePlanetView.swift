//
//  HomePlanetView.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 09.04.2022.
//

import UIKit

protocol HomePlanetViewProtocol: AnyObject {}

class HomePlanetView: UIViewController, HomePlanetViewProtocol {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let diameterLabel: UILabel = {
        let label = UILabel()
        label.text = "diametr"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let climateLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let gravityLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let terrainLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let populationLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var presenter: HomePlanetPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        
        self.navigationController?.navigationBar.topItem?.title = ""

        view.addSubview(nameLabel)
        
        view.addSubview(climateLabel)
        view.addSubview(gravityLabel)
        view.addSubview(terrainLabel)
        view.addSubview(populationLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        view.addSubview(diameterLabel)
        
        NSLayoutConstraint.activate([
            diameterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            diameterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            diameterLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -10),
            diameterLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
    }
}
