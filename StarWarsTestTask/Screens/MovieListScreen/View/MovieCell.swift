//
//  MovieCell.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 05.04.2022.
//

import UIKit

class MovieCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let producerLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .red
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let identifier = "MovieCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: MovieModel) {
        titleLabel.text = model.title
        releaseDateLabel.text = model.releaseDate
        directorLabel.text = "Director: \(model.director ?? "")"
        producerLabel.text = "Producer: \(model.producer ?? "")"
    }
    
    private func setupView() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        addSubview(releaseDateLabel)
        
        NSLayoutConstraint.activate([
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            releaseDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            releaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            releaseDateLabel.heightAnchor.constraint(equalToConstant: 12)
        ])
        
        addSubview(producerLabel)
        
        NSLayoutConstraint.activate([
            producerLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 5),
            producerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            producerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            producerLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        addSubview(directorLabel)
        
        NSLayoutConstraint.activate([
            directorLabel.topAnchor.constraint(equalTo: producerLabel.bottomAnchor, constant: 5),
            directorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            directorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            directorLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
 
}
