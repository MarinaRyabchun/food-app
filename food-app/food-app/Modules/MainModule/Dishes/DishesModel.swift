//
//  DishesModel.swift
//  food-app
//
//  Created by Марина Рябчун on 04.07.2023.
//

import Foundation

struct Dishes: Codable{
    let dishes: [Dish]
}

struct Dish: Codable, Identifiable {
    let id: Int?
    let name: String?
    let price: Int?
    let weight: Int?
    let description: String?
    let image_url: String?
    let tegs: [String]?
    
    init(id: Int, name: String, price: Int, weight: Int, description: String, image_url: String, tegs: [String] ) {
        self.id = id
        self.name = name
        self.price = price
        self.weight = weight
        self.description = description
        self.image_url = image_url
        self.tegs = tegs
    }
}
