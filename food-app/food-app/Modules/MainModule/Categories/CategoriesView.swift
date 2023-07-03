//
//  MainView.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject var viewModel = CategoriesViewModel()
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(viewModel.categories, id: \.id) { category in
                Button(action: {

                }, label: {
                    CategoryRow(category: category)
                })
            }
        }
        .onAppear {
            viewModel.fetchCategories()
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var viewModel = CategoriesViewModel()
//    static var previews: some View {
//        CategoriesView()
//    }
//}
