//
//  ButtonView.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import SwiftUI

struct CategoryRow: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var category: Category
    let imageWidth: CGFloat = 343
    let imageHeight: CGFloat = 148
    
    @Binding var selectedCategory: String?
    
    var body: some View {
        Button {
            selectedCategory = category.name ?? ""
            coordinator.push(.dishes)
        } label: {
            ZStack(alignment: .topLeading) {
                AsyncImageView(url: category.image_url, imageWidth: imageWidth, imageHeight: imageHeight)
                Text(category.name?.splitWords() ?? "Category")
                    .font(Constants.Fonts.headline)
                    .foregroundColor(Constants.Colors.black)
                    .multilineTextAlignment(.leading)
                    .offset(x: 16, y: 12)
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedCategory: String? = ""
        CategoryRow(category: Category.example1(), selectedCategory: $selectedCategory)
    }
}
