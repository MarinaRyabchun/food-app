//
//  APIMockService.swift
//  food-app
//
//  Created by Марина Рябчун on 07.07.2023.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    func fetch<T>(_ type: T.Type, url: URL?, completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
    }
    
    var result: Result<Categories, APIError>
    
    func fetch(_: Categories, url: URL?, completion: @escaping (Result<Categories, APIError>) -> Void) {
        completion(result)
    }
}

