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
    
    var cost: Int {
        var sum = 0
        for position in positions {
            sum += position.cost
        }
        return sum
    }
    
    func addPosition(_ position: Position) {
        if let existingPositionIndex = positions.firstIndex(where: { $0.dish.id == position.dish.id }) {
            positions[existingPositionIndex].count += 1
        } else {
            positions.append(position)
        }
    }
}
