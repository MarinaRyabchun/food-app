//
//  CategoriesViewModel.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import Foundation

class CategoriesViewModel: ObservableObject {
    
    @Published var categories = [Category]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchCategories()
    }
    
    func fetchCategories() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54")
        service.fetch(Categories.self, url: url) { [weak self] result in
            
            DispatchQueue.main.async {
                
                self?.isLoading = false
                switch result {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print(error)
                case .success(let categories):
                    print("--- sucess with \(categories.сategories.count)")
                    self?.categories = categories.сategories
                }
            }
        }
    }
}
