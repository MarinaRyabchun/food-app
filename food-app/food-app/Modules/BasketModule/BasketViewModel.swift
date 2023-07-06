//
//  BasketViewModel.swift
//  food-app
//
//  Created by Марина Рябчун on 05.07.2023.
//

import Foundation

class BasketViewModel: ObservableObject {
    
    static let shared = BasketViewModel()
    
    @Published var positions = [Position]()
    @Published var count = 0
    
    var cost: Int {
        var sum = 0
        for position in positions {
            sum += position.cost
        }
        return sum
    }
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }

}



