//
//  ViewController.swift
//  Resto
//
//  Created by Hurjay Medilo on 2/23/23.
//

import UIKit

struct Restaurant {
    var imageName: String
    var name: String
}


class RestaurantTableViewController: UITableViewController {
    
    private static let restaurantTableViewCellReuseIdentifier = "weeeeeee"
    
    var restaurants = [
        Restaurant(imageName: "jollibeeImage", name: "Jolibee"),
        Restaurant(imageName: "mcdoPic", name: "McDonald's"),
        Restaurant(imageName: "Wendys", name: "Wendy's"),
        Restaurant(imageName: "tacoBelll", name: "Taco Bell"),
        Restaurant(imageName: "kFc", name: "KFC"),
        Restaurant(imageName: "burgerKing", name: "Burger King"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()


        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            RestaurantTableViewCell.self, forCellReuseIdentifier: RestaurantTableViewController.restaurantTableViewCellReuseIdentifier
        )
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RestaurantTableViewController.restaurantTableViewCellReuseIdentifier,
            for: indexPath
        ) as? RestaurantTableViewCell
        else { return UITableViewCell() }

        let restaurant = restaurants[indexPath.row]
        cell.restaurantStackView.axis = .horizontal
        cell.restaurantNameLabel.text = restaurant.name
        cell.restaurantImageView.image = UIImage(named: restaurant.imageName)
        print(indexPath.row)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let restaurant = restaurants[indexPath.row]
        goToRestaurantDetailsViewController(restaurant: restaurant)
    }
    
    
    func goToRestaurantDetailsViewController(restaurant: Restaurant) {
        let detailsViewController = RestaurantDetailsViewController()
        detailsViewController.restaurant = restaurant

        navigationController?.pushViewController(detailsViewController, animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
}

