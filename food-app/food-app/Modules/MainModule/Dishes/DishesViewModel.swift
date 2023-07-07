//
//  DishesViewModel.swift
//  food-app
//
//  Created by Марина Рябчун on 04.07.2023.
//

import Foundation
import SwiftUI

class DishesViewModel: ObservableObject {
    
    @Published var dishes = [Dish]()
    @Published var selectedDish: Dish? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var selectedCategory: String? = nil
    @Published var tags = ["Все меню", "С рыбой", "С рисом", "Салаты"]
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchDishes()
    }
    
    func unselectDish() {
        self.selectedDish = nil
    }
    
    func fetchDishes() {
        
        isLoading = true
        errorMessage = nil
        
        //      В URL мщжно будет добавить category, если API будет под каждую категорию.
        let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b")
        service.fetch(Dishes.self, url: url) { [weak self] result in
            
            DispatchQueue.main.async {
                
                self?.isLoading = false
                switch result {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print(error)
                case .success(let dishes):
                    print("--- sucess with \(dishes.dishes.count)")
                    self?.dishes = dishes.dishes
                    //                    self.addTagsFromDishes(dishes.dishes)
                }
            }
        }
    }
    //    метод для заполнения массива с тегами, если API будет под каждую категорию
    private func addTagsFromDishes(_ dishes: [Dish]) {
        for dish in dishes {
            if let dishTags = dish.tegs {
                for tag in dishTags {
                    if !tags.contains(tag) {
                        tags.append(tag)
                    }
                }
            }
        }
    }
}
