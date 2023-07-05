//
//  BasketViewModel.swift
//  food-app
//
//  Created by Марина Рябчун on 05.07.2023.
//

import Foundation

class BasketViewModel: ObservableObject {
    
    @Published var dishes: [Dish]
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init(dishes: [Dish]) {
        self.dishes = dishes
    }

}



