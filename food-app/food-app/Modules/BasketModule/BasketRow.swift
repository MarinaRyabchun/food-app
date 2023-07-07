//
//  BasketRow.swift
//  food-app
//
//  Created by Марина Рябчун on 05.07.2023.
//

import SwiftUI

import SwiftUI
struct BasketRow: View {
    var position: Position
    let contentSize: CGFloat = 62
    let imageSize: CGFloat = 50
    
    @State var count = 1
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: contentSize, height: contentSize)
                    .foregroundColor(Constants.Colors.background)
                AsyncImageView(url: position.dish.image_url, imageWidth: imageSize, imageHeight: imageSize)
            }
            VStack(alignment: .leading) {
                Text(position.dish.name ?? "Dish")
                    .font(Constants.Fonts.mainBody)
                    .foregroundColor(Constants.Colors.black)
                HStack {
                    Text(String(position.dish.price ?? 0) + "₽")
                        .font(Constants.Fonts.mainBody)
                        .foregroundColor(Constants.Colors.black)
                    Text(String(position.dish.weight ?? 0) + "г")
                        .font(Constants.Fonts.mainBody)
                        .foregroundColor(Constants.Colors.black40)
                }
            }
            .frame(minWidth: 0, maxWidth: 119)
            Spacer()
            CustomStepper(count: $count)
        }
        .padding(.horizontal, 16)
        .onChange(of: count) { newValue in
            if newValue == 0 {
                BasketViewModel.shared.positions.removeAll { pos in
                    pos.dish.name == position.dish.name
                }
            }
        }
    }
}
struct BasketRow_Previews: PreviewProvider {
    static var previews: some View {
        BasketRow(position: Position.example1())
    }
}
