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
        ScrollView {
            VStack {
                ForEach(viewModel.categories) { category in
                    CategoryRow(category: category)
                }
            }
            .padding(.top, 8)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                GeoAndDateView()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                AccountButton()
            }
        }
        .onAppear {
            viewModel.fetchCategories()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
