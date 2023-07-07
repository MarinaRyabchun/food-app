//
//  BasketModel.swift
//  food-app
//
//  Created by Марина Рябчун on 06.07.2023.
//

struct Position: Identifiable {
    var id: String
    var count: Int
    var dish: Dish
    
    var cost: Int {
        return (dish.price ?? 0) * self.count
    }
    
    static func example1() -> Position {
        return Position(id: "UUID().uuidString",
                        count: 3,
                        dish: Dish.example1())
    }
}

