//
//  CategoryView.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import SwiftUI

struct DishesView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var viewModel = DishesViewModel()
    @State var selectedCategory: String?
    @State var selectedTag = ""
    
    var columns: [GridItem] = Array(repeating: .init(.fixed(109), alignment: .top), count: 3)
    
    var filteredDishes: [Dish] {
        if selectedTag == "Все меню" {
            return viewModel.dishes
        } else {
            return viewModel.dishes.filter { $0.tegs!.contains(selectedTag) }
        }
    }
    
    var body: some View {
            VStack{
                HStack {
                    Button {
                        coordinator.pop()
                    } label: {
                        Image(Constants.Image.leftBackButton)
                    }
                    .padding(.leading, 16)
                    Spacer()
                    Text(selectedCategory ?? "Category")
                        .font(Constants.Fonts.headline1)
                    Spacer()
                    AccountButton()
                        .padding(.trailing, 16)
                }
                HStack(spacing: 8) {
                    ForEach(viewModel.tags, id: \.self) { tag in
                        TagButton(title: tag, selectedTag: $selectedTag)
                    }
                }
                ScrollView{
                    LazyVGrid (
                        columns: columns,
                        alignment: .center,
                        spacing: 8,
                        pinnedViews: [.sectionHeaders, .sectionFooters]
                    ) {
                        ForEach(filteredDishes, id: \.id) { dish in
                            DishRow(dish: dish)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .padding(.top, 8)
        .onAppear {
            selectedTag = viewModel.tags[0]
            viewModel.fetchDishes()
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView(viewModel: DishesViewModel(service: APIService()))
    }
}
