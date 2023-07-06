//
//  BasketModel.swift
//  food-app
//
//  Created by Марина Рябчун on 06.07.2023.
//

struct Position: Identifiable {
    let id: String
    let count: Int
    let dish: Dish
    
    var cost: Int {
        return (dish.price ?? 0) * self.count
    }
}
