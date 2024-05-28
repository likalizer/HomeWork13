//
//  FavoriteTableViewCell.swift
//  Lesson13HW
//
//  Created by Лика Котик on 28.05.2024.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    static let identifier = "FavoriteTableViewCell"
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let manufacturerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let modelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(idLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(manufacturerLabel)
        contentView.addSubview(modelLabel)
        
        NSLayoutConstraint.activate([
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 5),
            
            manufacturerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            manufacturerLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            
            modelLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            modelLabel.topAnchor.constraint(equalTo: manufacturerLabel.bottomAnchor, constant: 5),
            modelLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with favorite: Favorite) {
        idLabel.text = "ID: \(favorite.id)"
        nameLabel.text = favorite.name
        manufacturerLabel.text = favorite.manufacturer
        modelLabel.text = favorite.model
    }
}
