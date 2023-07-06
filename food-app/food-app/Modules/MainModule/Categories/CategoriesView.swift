//
//  MainView.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject var viewModel = CategoriesViewModel()
    @State var selectedCategory: String?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(viewModel.categories, id: \.id) { category in
                            CategoryRow(category: category, selectedCategory: $selectedCategory)
                    }
                }
            }
            .padding(.top, 8)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    GeoAndDateView()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    AccountButton()
                }
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
