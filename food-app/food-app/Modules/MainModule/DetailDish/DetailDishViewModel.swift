//
//  DetailDishViewModel.swift
//  food-app
//
//  Created by Марина Рябчун on 05.07.2023.
//

import Foundation

class DetailDishViewModel: ObservableObject {
    
    @Published var dish: Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
}
