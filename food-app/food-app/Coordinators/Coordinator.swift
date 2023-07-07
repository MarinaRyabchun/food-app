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

enum FullScreenCover: String, Identifiable {
    case detail

    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {

    @Published var path = NavigationPath()
    @Published var fullScreenCover: FullScreenCover?
    @Published var content: Dish?


    @Published var tab = Page.categories

    func push(_ page: Page) {
        path.append(page)
    }

    func present(fullScreenCover: FullScreenCover, content: Dish) {
        self.fullScreenCover = fullScreenCover
        self.content = content
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func dismissFullScreenCover() {
        self.fullScreenCover = nil
        self.content = nil
    }

    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .categories:
            CategoriesView(viewModel: CategoriesViewModel(service: APIService()))
        case .search:
            SearchView()
        case .basket:
            BasketView(viewModel: BasketViewModel.shared)
        case .account:
            AccountView()
        case .dishes:
            DishesView(viewModel: DishesViewModel(service: APIService()))
        }
    }

    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .detail:
            DetailDishView(viewModel: DetailDishViewModel(dish: self.content ?? Dish.example1()))
        }
    }
}
