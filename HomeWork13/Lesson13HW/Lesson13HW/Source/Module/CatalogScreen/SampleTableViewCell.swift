//
//  SampleTableViewCell.swift
//  Lesson13HW
//
//  Created by Лика Котик on 28.05.2024.
//


import UIKit


class SampleTableViewCell: UITableViewCell {
    
    static let identifier = "SampleTableViewCell"
    
    let productImageView = SampleTableViewCell.createImageView()
    let idLabel = SampleTableViewCell.createLabel(fontSize: 14, textColor: .gray)
    let nameLabel = SampleTableViewCell.createLabel(fontSize: 18)
    let manufacturerLabel = SampleTableViewCell.createLabel(fontSize: 16, textColor: .darkGray)
    let modelLabel = SampleTableViewCell.createLabel(fontSize: 16, textColor: .darkGray)
    let priceLabel = SampleTableViewCell.createLabel(fontSize: 16, textColor: .systemGreen)
    let ratingStackView = SampleTableViewCell.createRatingStackView()
    let favoriteButton = SampleTableViewCell.createFavoriteButton()
    
    var favoriteButtonAction: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [productImageView, idLabel, nameLabel, manufacturerLabel, modelLabel, priceLabel, ratingStackView, favoriteButton].forEach {
            contentView.addSubview($0)
        }
        
        setupConstraints()
        
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func favoriteButtonTapped() {
        favoriteButtonAction?()
    }
    
    func configure(with item: Pc) {
        idLabel.text = "ID: \(item.id)"
        nameLabel.text = "Name: \(item.name)"
        manufacturerLabel.text = "Manufacturer: \(item.manufacturer)"
        modelLabel.text = "Model: \(item.model)"
        priceLabel.text = "Price: \(item.price) \(item.currency)"
        favoriteButton.setImage(UIImage(systemName: item.favorite() ? "star.fill" : "star"), for: .normal)
     
        ratingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for _ in 0..<item.rating {
            let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
            starImageView.tintColor = .systemYellow
            ratingStackView.addArrangedSubview(starImageView)
        }
        for _ in item.rating..<5 {
            let starImageView = UIImageView(image: UIImage(systemName: "star"))
            starImageView.tintColor = .systemYellow
            ratingStackView.addArrangedSubview(starImageView)
        }

        productImageView.image = UIImage(named: "pcPlaceholder")
    }
    
    private func setupConstraints() {
        activateConstraints([
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productImageView.widthAnchor.constraint(equalToConstant: 60),
            productImageView.heightAnchor.constraint(equalToConstant: 60),
            
            ratingStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            ratingStackView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10),
            ratingStackView.widthAnchor.constraint(equalToConstant: 100),
            ratingStackView.heightAnchor.constraint(equalToConstant: 20),
            
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            priceLabel.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: 10),
            
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150),
            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150),
            nameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 5),
            
            manufacturerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150),
            manufacturerLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            
            modelLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150),
            modelLabel.topAnchor.constraint(equalTo: manufacturerLabel.bottomAnchor, constant: 5),
            
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            favoriteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    private func activateConstraints(_ constraints: [NSLayoutConstraint]) {
        NSLayoutConstraint.activate(constraints)
    }
    
    static func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    static func createLabel(fontSize: CGFloat, textColor: UIColor = .black) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textColor = textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func createRatingStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    static func createFavoriteButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = .systemYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
