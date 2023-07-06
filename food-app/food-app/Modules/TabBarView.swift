//
//  TabBarView.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import SwiftUI

struct TabBarView: View {
    @State var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            CategoriesView()
                .tabItem {
                    TabItemView(image: Constants.Image.mainTabIcon,
                                title: "Главная")
                }
                .tag(0)
            SearchView()
                .tabItem {
                    TabItemView(image: Constants.Image.searchTabIcon,
                                title: "Поиск")
                }
                .tag(1)
            BasketView(viewModel: BasketViewModel.shared)
                .tabItem {
                    TabItemView(image: Constants.Image.basketTabIcon,
                                title: "Корзина")
                }
                .tag(2)
//            AccountView()
            DishesView()
                .tabItem {
                    TabItemView(image: Constants.Image.accountTabIcon,
                                title: "Аккаунт")
                }
                .tag(3)
        }
        .tint(Constants.Colors.accent)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
