//
//  CategoriesModel.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import Foundation

struct Categories: Codable{
    let сategories: [Category]
}

struct Category: Codable, Identifiable {
//    var id = UUID()
    let id: Int?
    let name: String?
    let image_url: String?
    
    init(id: Int, name: String, image_url: String) {
        self.id = id
        self.name = name
        self.image_url = image_url
    }
}
