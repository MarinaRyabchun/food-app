//
//  ContentView.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabBarView(coordinator: Coordinator(), dishesViewModel: DishesViewModel(), basketViewModel: BasketViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
