//
//  DishRow.swift
//  food-app
//
//  Created by Марина Рябчун on 04.07.2023.
//

import SwiftUI

struct DishRow: View {
    @EnvironmentObject private var coordinator: Coordinator
    var dish: Dish
    let contentSize: CGFloat = 110
    let imageSize: CGFloat = 85
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: contentSize, height: contentSize)
                    .foregroundColor(Constants.Colors.background)
                AsyncImageView(url: dish.image_url, imageWidth: imageSize, imageHeight: imageSize)
            }
            Text(dish.name ?? "Dish")
                .font(Constants.Fonts.mainBody)
                .foregroundColor(Constants.Colors.black)
                .multilineTextAlignment(.leading)
        }
        .frame(width: 109)
    }
}

struct DishRow_Previews: PreviewProvider {
    static var previews: some View {
        DishRow(dish: Dish.example1())
    }
}
