//
//  food_appTests.swift
//  food-appTests
//
//  Created by Марина Рябчун on 03.07.2023.
//

import XCTest
@testable import food_app

class food_appTests: XCTestCase {
    
    private var sut: CategoriesViewModel!
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    
    func test_loading_error() {
        
        let errorMessage = "Sorry, something went wrong."
        let result = Result<Categories, APIError>.failure(APIError.badURL)
        sut = CategoriesViewModel(service: APIMockService(result: result))
        
    }
}
