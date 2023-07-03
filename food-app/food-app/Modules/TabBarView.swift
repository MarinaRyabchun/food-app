//
//  TabBarView.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import SwiftUI

struct TabBarView: View {
    @State var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            CategoryesView()
                .tabItem {
                    Label("Главная", image: Constants.Image.mainTabIcon)
                }
                .tag(0)
            SearchView()
                .tabItem {
                    Label("Поиск", image: Constants.Image.searchTabIcon)
                }
                .tag(1)
            BasketView()
                .tabItem {
                    Label("Корзина", image: Constants.Image.basketTabIcon)
                }
                .tag(2)
            AccountView()
                .tabItem {
                    Label("Аккаунт", image: Constants.Image.accountTabIcon)
                }
                .tag(3)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
