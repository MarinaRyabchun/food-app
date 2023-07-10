//
//  TabBarView.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @StateObject var coordinator: Coordinator
    @StateObject var dishesViewModel: DishesViewModel
    @StateObject var basketViewModel: BasketViewModel
    
    var body: some View {
        TabView(selection: $coordinator.tab) {
            NavigationStack(path: $coordinator.path) {
                coordinator.build(page: .categories)
                    .navigationDestination(for: Page.self) { page in
                        coordinator.build(page: page)
                    }
            }
            .tabItem {
                TabItemView(image: Constants.Image.mainTabIcon,
                            title: "Главная")
            }
            .tag(Page.categories)
            coordinator.build(page: .search)
                .tabItem {
                    TabItemView(image: Constants.Image.searchTabIcon,
                                title: "Поиск")
                }
                .tag(Page.search)
            coordinator.build(page: .basket)
                .tabItem {
                    TabItemView(image: Constants.Image.basketTabIcon,
                                title: "Корзина")
                }
                .tag(Page.basket)
            coordinator.build(page: .account)
                .tabItem {
                    TabItemView(image: Constants.Image.accountTabIcon,
                                title: "Аккаунт")
                }
                .tag(Page.account)
        }
        .tint(Constants.Colors.accent)
        .environmentObject(coordinator)
        .environmentObject(dishesViewModel)
        .environmentObject(basketViewModel)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(coordinator: Coordinator(), dishesViewModel: DishesViewModel(), basketViewModel: BasketViewModel())
    }}
