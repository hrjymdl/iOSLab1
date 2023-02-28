//
//  RestaurantDetailsViewController.swift
//  Resto
//
//  Created by Hurjay Medilo on 2/26/23.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
    
    var restaurant: Restaurant?
    
    private let restaurantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        return imageView
    }()
    
    private let restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let restaurant = restaurant else {
            return
        }
        
        view.backgroundColor = .white
        view.addSubview(restaurantImageView)
        view.addSubview(restaurantNameLabel)
        
        restaurantImageView.image = UIImage(named: restaurant.imageName)
        restaurantNameLabel.text = restaurant.name

        let constraints = [
            restaurantImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            restaurantImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),

            
            restaurantNameLabel.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 10),
            restaurantNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            restaurantNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
        ]
        
        NSLayoutConstraint.activate(constraints)
      
    }
}
