//
//  PersonListCell.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 06.04.2022.
//

import UIKit

class PersonListCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Test"
        lable.font = .systemFont(ofSize: 18, weight: .bold)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let genderLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Test"
        lable.font = .systemFont(ofSize: 15, weight: .regular)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let dateOfBirthLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Test"
        lable.font = .systemFont(ofSize: 15, weight: .regular)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    static let identifier = "PersonListCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: PersonModel) {
        nameLabel.text = model.name
        genderLabel.text = model.gender
        dateOfBirthLabel.text = "Was born on \(model.dateOfBirth ?? "")"
    }
    
    //MARK: - Constraints
    private func setupView() {
        
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
        
        addSubview(genderLabel)
        
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            genderLabel.heightAnchor.constraint(equalToConstant: 18),
            genderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            genderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
        
        addSubview(dateOfBirthLabel)
        
        NSLayoutConstraint.activate([
            dateOfBirthLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 5),
            dateOfBirthLabel.heightAnchor.constraint(equalToConstant: 18),
            dateOfBirthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            dateOfBirthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
        
    }
}
