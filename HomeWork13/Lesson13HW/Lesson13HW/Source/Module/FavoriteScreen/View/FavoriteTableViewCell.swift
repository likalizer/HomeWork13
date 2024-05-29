//
//  FavoriteTableViewCell.swift
//  Lesson13HW
//
//  Created by Лика Котик on 28.05.2024.
//

import UIKit


class FavoriteTableViewCell: UITableViewCell {
    
    static let identifier = "FavoriteTableViewCell"
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var idLabel: UILabel = {
        return createLabel(fontSize: 14, textColor: .gray)
    }()
    
    private lazy var nameLabel: UILabel = {
        return createLabel(fontSize: 18, weight: .medium)
    }()
    
    private lazy var manufacturerLabel: UILabel = {
        return createLabel(fontSize: 16, weight: .light, textColor: .darkGray)
    }()
    
    private lazy var modelLabel: UILabel = {
        return createLabel(fontSize: 16, weight: .light, textColor: .darkGray)
    }()
    
    private func createLabel(fontSize: CGFloat, weight: UIFont.Weight = .regular, textColor: UIColor = .black) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.textColor = textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
        
        [idLabel, nameLabel, manufacturerLabel, modelLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
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
