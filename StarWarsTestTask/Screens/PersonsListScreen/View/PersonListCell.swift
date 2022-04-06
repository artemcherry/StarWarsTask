//
//  PersonListCell.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 06.04.2022.
//

import UIKit

class PersonListCell: UITableViewCell {
    
    static let identifier = "PersonListCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
