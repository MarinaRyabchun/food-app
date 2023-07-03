//
//  APIServiceProtocol.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import Foundation

protocol APIServiceProtocol {
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void)
}
