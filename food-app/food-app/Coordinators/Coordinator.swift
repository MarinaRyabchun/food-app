//
//  Coordinator.swift
//  food-app
//
//  Created by Марина Рябчун on 07.07.2023.
//

import SwiftUI

enum Page: String, Identifiable {
    case categories, search, basket, account, dishes
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @State var showPopup: Bool = false
    
    
    @Published var tab = Page.categories
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .categories:
            CategoriesView(viewModel: CategoriesViewModel(service: APIService()))
        case .search:
            SearchView()
        case .basket:
            BasketView(viewModel: BasketViewModel.shared)        case .account:
            AccountView()
        case .dishes:
            DishesView(viewModel: DishesViewModel(service: APIService()), showPopup: showPopup)
        }
    }
}
