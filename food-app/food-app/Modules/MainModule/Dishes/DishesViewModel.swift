//
//  DishesViewModel.swift
//  food-app
//
//  Created by Марина Рябчун on 04.07.2023.
//

import Foundation


class DishesViewModel: ObservableObject {
    
    @Published var dishes = [Dish]()
    @Published var tags = ["Все меню", "С рыбой", "С рисом", "Салаты"]
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchDishes()
    }
    
    func fetchDishes() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b")
        service.fetch(Dishes.self, url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                case .success(let dishes):
                    print("--- sucess with \(dishes.dishes.count)")
                    self.dishes = dishes.dishes
//                    self.addTagsFromDishes(dishes.dishes)
                }
            }
        }
    }
    
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


