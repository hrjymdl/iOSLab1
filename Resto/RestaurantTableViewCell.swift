//
//  RestaurantTableViewCell.swift
//  Resto
//
//  Created by Hurjay Medilo on 2/23/23.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    let restaurantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        return imageView
    }()
    
    let restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center

        return label
    }()
    
    let restaurantStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical

        stackView.alignment = .center
        
        return stackView
    }()
    
    let innerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.alignment = .center
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(restaurantStackView)
        restaurantStackView.addArrangedSubview(innerStackView)
        innerStackView.addArrangedSubview(restaurantImageView)
        innerStackView.addArrangedSubview(restaurantNameLabel)
        
        let constraints = [
            restaurantStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            restaurantStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            restaurantStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            restaurantStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

